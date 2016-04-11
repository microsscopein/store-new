<?php
class ControllerUpgrade extends Controller {
	private $error = array();

	public function index() {

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['action'] = HTTP_SERVER . 'index.php?route=upgrade/upgrade';

		$data['header'] = $this->load->controller('header');
		$data['footer'] = $this->load->controller('footer');

		$this->response->setOutput($this->load->view('upgrade.tpl', $data));

	}

	public function success() {
		$data = array();

		$data['header'] = $this->load->controller('header');
		$data['footer'] = $this->load->controller('footer');

		$this->response->setOutput($this->load->view('success.tpl', $data));
	}

	public function upgrade() {

		if ($this->validate()) {

			$this->load->model('upgrade');

			$this->model_upgrade->mysql($this->request->post, 'upgrade.sql');
			
			$this->model_upgrade->modifications();

			$this->response->redirect(HTTP_SERVER . 'index.php?route=upgrade/success');
		} else {
			die($this->error['warning']);
		}

	}

	private function validate() {
		if (DB_DRIVER == 'mysql') {
			if (!$connection = @mysql_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD)) {
				$this->error['warning'] = 'Error: Could not connect to the database please make sure the database server, username and password is correct in the config.php file!';
			} else {
				if (!mysql_select_db(DB_DATABASE, $connection)) {
					$this->error['warning'] = 'Error: Database "' . DB_DATABASE . '" does not exist!';
				}

				mysql_close($connection);
			}
		}

		return !$this->error;
	}
}
?>