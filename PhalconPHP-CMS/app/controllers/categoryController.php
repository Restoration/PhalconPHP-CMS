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
		    if($data['action'] == 'edit'){
			    return $this->response->redirect("category/edit");
		    }
		    return $this->response->redirect("category/index");
	    }
	    $category = new mst_category();
		$data = $this->request->getPost();
		if (!$this->validation($data)) {
		    if($data['action'] == 'edit'){
			    return $this->response->redirect("category/edit");
		    }
			return $this->response->redirect("category/index");
	    }
	    $category->category_id = $data['category_id'];
	    $category->category_name = $data['category_name'];
	    $category->category_slug = $data['category_slug'];
	    $category->category_description = $data['category_description'];
	    $category->category_parent_id = $data['category_parent_id'];
	    $category->dltflg = 0;

		if ($category->save($data) === false) {
        	foreach ($category->getMessages() as $message) {
	        	$this->flashSession->error($message);
	        }
		    if($data['action'] == 'edit'){
			    return $this->response->redirect("category/edit");
		    }
	        return $this->response->redirect("category/index");
		}

		$this->flashSession->success(
			"Category was updated successfully"
		);
		return $this->response->redirect("category/index");
	}

    public function editAction()
    {
	    $this->view->setTemplateAfter('common');
	    $id = $this->request->get("id", "int");
	    if(!empty($id)){
		    $result = mst_category::findFirst($id);
		    $this->view->setVar("category",$result);
	    }
    }

	private function validation($data)
	{
		$validation = new Validation();
		$validation->add(
		    "category_name",
			new StringLength([
			     'max' => 60,
			     'min' => 1,
			     'messageMaximum' => 'We don\'t like really long Category Name',
			     'messageMinimum' => 'We want more than just their initials'
			 ])
		);

		$validation->add(
		    "category_slug",
			new StringLength([
			     'max' => 60,
			     'min' => 1,
			     'messageMaximum' => 'We don\'t like really long Category Slug',
			     'messageMinimum' => 'We want more than just their initials'
			 ])
		);

		$validation->add(
		    "category_description",
			new StringLength([
			     'max' => 200,
			     'messageMaximum' => 'We don\'t like really long Category Description',
			 ])
		);
		$messages = $validation->validate($data);
		if (count($messages)) {
		    foreach ($messages as $message) {
		        $this->flashSession->error($message);
		    }
		    return false;
		}
	    return true;
	}
}