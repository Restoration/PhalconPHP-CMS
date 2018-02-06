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

    public function saveAction()
    {
	    if (!$this->request->isPost()) {
		    return $this->response->redirect("category/index");
	    }
	    $category = new mst_category();
		$data = $this->request->getPost();
		//if (!$this->validation($data)) {
			//return $this->response->redirect("category/index");
	    //}
	    $category->category_id = $id;
	    $category->category_name = $data['category_name'];;
	    $category->category_slug = $data['category_slug'];
	    $category->category_description = $data['category_description'];
	    /*
	    category_parent_id
	    */
	    $category->dltflg = 0;

		if ($category->save($data) === false) {
        	foreach ($category->getMessages() as $message) {
	        	$this->flashSession->error($message);
	        }
	        return $this->response->redirect("category/index");
		}

		$this->flashSession->success(
			"Category was updated successfully"
		);
		return $this->response->redirect("category/index");
	}
}