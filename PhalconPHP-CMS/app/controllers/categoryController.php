<?php
use Phalcon\Mvc\Model as Model;
use Phalcon\Validation as Validation;
use Phalcon\Flash\Session as FlashSession;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Http\Response as Response;

class categoryController extends ControllerBase
{

    public function indexAction()
    {
        $this->view->setTemplateAfter('common');
        $action = $this->request->get("action");
        $this->view->setVar("action",$action);
    }

    // Category/index Page get Ajax list data
    public function ajaxGetCategoryAction()
    {
	    $action = $this->request->get("action");
        $category = new mst_category();
        $response = new Response();
        $result = $category->getResult($action);
		$response->setStatusCode(200,'OK');
		$response->setContentType('application/json','UTF-8');
        $response->setContent(json_encode($result));
        return $response;
    }
}

