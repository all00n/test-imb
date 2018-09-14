<?php

include './models/Price.php';

class Controller {
    public function index() {
        $Model = new Price();
        $product = $Model->getProduct();
        $this->render('./views/view.php',  $product);
    }

    private function render($path, $data = [])
    {
        include $path;
    }
}
