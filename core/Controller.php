<?php

class Controller extends Application{
	protected $_controller, $_action;
	public $view;

	public function __construct($controller, $action){
		parent::__construct();
		$this->_controller = $controller;
		$this->_action = $action;
		$this->view = new View();
	}
<<<<<<< HEAD
=======

	protected function load_model($model){
		if(class_exists($model)){
			return new $model();
			// $this->{$model.'Model'} = new $model(/*strtolower($model)*/);
		}
	}
>>>>>>> model-sample
}