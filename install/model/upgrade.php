<?php
class ModelUpgrade extends Model {
	public function mysql($data, $sqlfile) {
		ini_set('display_errors', 1);
		error_reporting(E_ALL);

		$connection = mysql_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD);

		mysql_select_db(DB_DATABASE, $connection);

		mysql_query("SET NAMES 'utf8'", $connection);
		mysql_query("SET CHARACTER SET utf8", $connection);

		$file = DIR_APPLICATION . $sqlfile;

		if (!file_exists($file)) { die('Could not load sql file: ' . $file); }

		if ($sql = file($file)) {
			$query = '';

			foreach($sql as $line) {
				$tsl = trim($line);

				if (($sql != '') && $tsl && (substr($tsl, 0, 2) != "--") && (substr($tsl, 0, 1) != '#')) {

					// Improved compatibility...
					$line = str_replace("oc_", DB_PREFIX, $line);
					$line = str_replace(" order ", " `order` ", $line);
					$line = str_replace(" ssl ", " `ssl` ", $line);
					$line = str_replace("NOT NULL DEFAULT ''", "NOT NULL", $line);
					$line = str_replace("NOT NULL DEFAULT NULL", "NOT NULL", $line);
					$line = str_replace("NOT NULL DEFAULT 0 COMMENT '' auto_increment", "NOT NULL COMMENT '' auto_increment", $line);
					$line = str_replace("DROP TABLE IF EXISTS", "DROP TABLE", $line); //rename all to one method
					$line = str_replace("DROP TABLE", "DROP TABLE IF EXISTS", $line); //rename back to correct method

					// Check existing conditions for specific commands
					// For example, ALTER TABLE will error if the table has since been removed,
					// So validate the table exists first, etc.
					if (preg_match('/^ALTER TABLE (.+?) ADD PRIMARY KEY/', $line, $matches)) {
						$info = mysql_fetch_assoc(mysql_query(sprintf("SHOW KEYS FROM %s",$matches[1]), $connection));
						if ($info['Key_name'] == 'PRIMARY') { continue; }
					}
					if (preg_match('/^ALTER TABLE (.+?) ADD INDEX (.+?) /', $line, $matches)) {
						$info = mysql_fetch_assoc(mysql_query(sprintf("SHOW INDEX FROM %s",$matches[1]), $connection));
						if ($info['Key_name'] == 'PRIMARY') { continue; }
					}
					if (preg_match('/^ALTER TABLE (.+?) ADD PRIMARY KEY/', $line, $matches)) {
						$info = mysql_fetch_assoc(mysql_query(sprintf("SHOW KEYS FROM %s",$matches[1]), $connection));
						if ($info['Key_name'] == 'PRIMARY') { continue; }
					}
					if (preg_match('/^ALTER TABLE (.+?) ADD (.+?) /', $line, $matches)) {
						if (@mysql_num_rows(@mysql_query(sprintf("SHOW COLUMNS FROM %s LIKE '%s'", $matches[1],str_replace('`', '', $matches[2])), $connection)) > 0) { continue; }
					}
					if (preg_match('/^ALTER TABLE (.+?) DROP (.+?) /', $line, $matches)) {
						if (@mysql_num_rows(@mysql_query(sprintf("SHOW COLUMNS FROM %s LIKE '%s'", $matches[1],str_replace('`', '', $matches[2])), $connection)) <= 0) { continue; }
					}
					if (preg_match('/^ALTER TABLE ([^\s]+) DEFAULT (.+?) /', $line, $matches)) {
						if (@mysql_num_rows(@mysql_query(sprintf("SHOW TABLES LIKE '%s'", str_replace('`', '', $matches[1])), $connection)) <= 0) { continue; }
					}
					if (preg_match('/^ALTER TABLE (.+?) MODIFY (.+?) /', $line, $matches)) {
						if (@mysql_num_rows(@mysql_query(sprintf("SHOW COLUMNS FROM %s LIKE '%s'", $matches[1],str_replace('`', '', $matches[2])), $connection)) <= 0) { continue; }
					}
					if (strpos($line, 'ALTER TABLE') !== false && strpos($line, 'DROP') !== false && strpos($line, 'PRIMARY') === false) {
						$params = explode(' ', $line);
						if ($params[3] == 'DROP') {
							if (@mysql_num_rows(@mysql_query(sprintf("SHOW COLUMNS FROM $params[2] LIKE '$params[4]'", $matches[1],str_replace('`', '', $matches[2])), $connection)) <= 0) { continue; }
						}
					}
					if (preg_match('/^ALTER TABLE (.+?) MODIFY (.+?) /', $line, $matches)) {
						if (@mysql_num_rows(@mysql_query(sprintf("SHOW COLUMNS FROM %s LIKE '%s'", $matches[1],str_replace('`', '', $matches[2])), $connection)) <= 0) { continue; }
					}

					$query .= $line;

					// If the line has a semicolon, consider it a complete query
					if (preg_match('/;\s*$/', $line)) {
						$query = str_replace("DROP TABLE IF EXISTS `oc_", "DROP TABLE IF EXISTS `" . DB_PREFIX, $query);
						$query = str_replace("CREATE TABLE `oc_", "CREATE TABLE `" . DB_PREFIX, $query);
						$query = str_replace("INSERT INTO `oc_", "INSERT INTO `" . DB_PREFIX, $query);

						$result = mysql_query($query, $connection);

						if (!$result) {
							die("Could not Execute: $query <br />" . mysql_error());
						}

						$query = '';
					}
				}
			}

			mysql_query("SET CHARACTER SET utf8", $connection);
			mysql_query("SET @@session.sql_mode = 'MYSQL40'", $connection);

			mysql_close($connection);
		}
	}

	public function modifications() {

		### Additional Changes
		$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

		// Settings
		$query = $db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '0' ORDER BY store_id ASC");

		foreach ($query->rows as $setting) {
			if (!$setting['serialized']) {
				$settings[$setting['key']] = $setting['value'];
			} else {
				$settings[$setting['key']] = unserialize($setting['value']);
			}
		}
		// Layout routes now require "%" for wildcard paths
		$layout_route_query = $db->query("SELECT * FROM " . DB_PREFIX . "layout_route");
		foreach ($layout_route_query->rows as $layout_route) {
			if (strpos($layout_route['route'], '/') === false) { // If missing the trailing slash, add "/%"
					$db->query("UPDATE " . DB_PREFIX . "layout_route SET route = '" . $layout_route['route'] . "/%' WHERE `layout_route_id` = '" . $layout_route['layout_route_id'] . "'");
			} elseif (strrchr($layout_route['route'], '/') == "/") { // If has the trailing slash, then just add "%"
					$db->query("UPDATE " . DB_PREFIX . "layout_route SET route = '" . $layout_route['route'] . "%' WHERE `layout_route_id` = '" . $layout_route['layout_route_id'] . "'");
			}
		}

		// Attempt to add new HTTPS_CATALOG to the admin/config.php
		// Get HTTP_ADMIN from main config.php to find out what the admin folder name is incase it was renamed
		$file = file(DIR_OPENCART . 'config.php');

		foreach ($file as $num => $line) {
			if (strpos(strtoupper($line), 'HTTP_ADMIN') !== false) {
				eval($line);
				break;
			}
		}

		if (defined('HTTP_ADMIN')) {
			$adminFolder = trim(str_replace(str_replace('install/', '', HTTP_SERVER), '', HTTP_ADMIN), '/');

			$dirAdmin = str_replace("\\", "/", realpath(DIR_SYSTEM . '../' . $adminFolder . '/') . '/');

			// If directory exists...
			if (is_dir($dirAdmin)) {

				// If config.php exists and is writable...
				if (is_writable($dirAdmin . 'config.php')) {
					$lines = file($dirAdmin . 'config.php');

					// Loop through and seee if HTTPS_CATALOG already exists and get the values for HTTP_CATALOG and HTTPS_SERVER
					$exists = false;
					$schema = 'http';
					$http_catalog = false;
					$https_server_idx = false;
					foreach ($lines as $i => $line) {
						if (strpos($line, 'HTTPS_CATALOG') !== false) {
							$exists = true;
							break;
						} elseif (strpos($line, 'HTTP_CATALOG') !== false) {
							$http_catalog = $lines[$i];
						} elseif (strpos($line, 'HTTPS_SERVER')) {
							$https_server_idx = $i;
							if (strpos($lines[$i], 'https://') !== false) {
								$schema = 'https';
							}
						}
					}

					// If not exists, add it
					if (!$exists && $http_catalog && $https_server_idx !== false){
						//$https_catalog_line = "define('HTTPS_CATALOG', " . str_replace(array('http','https'), $schema, $http_catalog) . ");";
						$https_catalog = str_replace('HTTP_CATALOG', 'HTTPS_CATALOG', str_replace(array('http','https'), $schema, $http_catalog));
						$lines[$https_server_idx] = $lines[$https_server_idx] . $https_catalog;

						// Write the data back to the config file
						$data = '';
						foreach ($lines as $line) {
							$data .= $line;
						}
						file_put_contents($dirAdmin . 'config.php', $data);
					}
				}
			}
		}
	}
}
?>