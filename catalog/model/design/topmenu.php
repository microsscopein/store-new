<?php
class ModelDesignTopmenu extends Model {
	public function getMenu() {

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		$this->load->model('catalog/category');
		
		$top_cats = $this->model_catalog_category->getCategories(0);
		$category = "<ul class=\"menu\">\n";
		foreach ($top_cats as $top_cat)	{
			if ($top_cat['top']) {
				$name	= $top_cat['name'];
				$href	= $this->url->link('product/category', 'path=' . $top_cat['category_id']);
				$class	= in_array($top_cat['category_id'], $parts) ?  " class=\"active\"" : "";
				$category .= "<li>\n<a href=\"".$href."\"".$class.">".$name."</a>\n";
				$category .= $this->getCatTree($top_cat['category_id'])."\n</li>\n";
			}
		}

		return $category."\n</ul>\n";
	} 	

	function getCatTree ($category_id = 0)	{
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		$this->load->model('catalog/category');
		$category_data = "";

		$categories = $this->model_catalog_category->getCategories((int)$category_id);

		foreach ($categories as $category) {
			$name = $category['name'] ;
			$href = $this->url->link('product/category', 'path=' . $category['category_id']);
			$class = in_array($category['category_id'], $parts) ?  " class=\"active\"" : "";
			$parent = $this->getCatTree($category['category_id']);
			if ($parent) {
				$class = $class	? " class=\"active\"" : " class=\"parent\"";
			}
			
				$category_data .= "<li>\n<a href=\"".$href."\"".$class.">".$name."</a>".$parent."\n</li>\n";
			

		}

		return strlen($category_data) ? "<ul>\n".$category_data."\n</ul>\n" : "";
	}
}

?>