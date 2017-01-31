<?php
use Phalcon\Mvc\Model as Model;
use Phalcon\Validation as Validation;
use Phalcon\Flash\Session as FlashSession;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Http\Response as Response;


class PostController extends ControllerBase
{

	public function initialize(){
    }
    public function indexAction()
    {
        $this->view->setTemplateAfter('common');
        $action = $this->request->get("action");
        $this->view->setVar("action",$action);

    }
    // Post/index Page get Ajax list data
    public function ajaxGetPostAction()
    {
	    $action = $this->request->get("action");
        $post = new trn_post();
        $response = new Response();
        $result = $post->getResult($action);
		$response->setStatusCode(200,'OK');
		$response->setContentType('application/json','UTF-8');
        $response->setContent(json_encode($result));
        return $response;
    }

    public function editAction()
    {
	    $this->view->setTemplateAfter('common');
	    $id = $this->request->get("id", "int");
	    if(!empty($id)){
		    $result = trn_post::findFirst($id);
		    $this->view->setVar("post",$result);
	    }
    }

    public function saveAction($id)
    {
	    if (!$this->request->isPost()) {
		    return $this->response->redirect("post/edit");
	    }
	    $post = new trn_post();
		$data = $this->request->getPost();
		if (!$this->validation($data)) {
			return $this->response->redirect("post/edit");
	    }
	    $post->id = $id;
	    $post->user_id = 1; //Temporary
	    $post->post_title = $data['post_title'];
	    $post->post_message = $data['post_message'];

		if ($post->save($data) === false) {
        	foreach ($post->getMessages() as $message) {
	        	$this->flashSession->error($message);
	        }
	        return $this->response->redirect("post/edit");
		}

		$this->flashSession->success(
			"Post was updated successfully"
		);
		return $this->response->redirect("post/index");
	}
    /**
     * Logical deletes an existing post
     */
    public function deleteAction()
    {
	    if (!$this->request->isPost()) {
		    return $this->response->redirect("post/index");
	    }
	    $post = new trn_post();
		$data = $this->request->getPost();
	    if(empty($data['id'])){
			$this->flashSession->error(
				"Please check the checkbox"
			);
			return $this->response->redirect("post/index");
	    }
	    for($i = 0; $i < count($data['id']); $i++){
	    	$post = trn_post::findFirst($data['id'][$i]);
	    	$post->dltflg = 1;
		    if ($post->save() == false) {
	    		foreach ($post->getMessages() as $message) {
	        		$this->flashSession->error($message);
	        		break;
	        	}
				return $this->response->redirect("post/index");
		    }
	    }
		$this->flashSession->success(
			"Post was updated successfully"
		);
		return $this->response->redirect("post/index");
	}

    /**
     * Restore post or Delete post
     */
    public function restoreAction()
    {
	    if (!$this->request->isPost()) {
		    return $this->response->redirect("post/index&action=trash");
	    }
	    $post = new trn_post();
		$data = $this->request->getPost();
	    if(empty($data['id'])){
			$this->flashSession->error(
				"Please check the checkbox"
			);
			return $this->response->redirect("post/index&action=trash");
	    }
		// Restore process
		if($data['submit'] == 'Restore'){
		    for($i = 0; $i < count($data['id']); $i++){
		    	$post = trn_post::findFirst($data['id'][$i]);
		    	$post->dltflg = 0;
			    if ($post->save() == false) {
		    		foreach ($post->getMessages() as $message) {
		        		$this->flashSession->error($message);
		        		break;
		        	}
					return $this->response->redirect("post/index&action=trash");
			    }
		    }
		} else {
		    for($i = 0; $i < count($data['id']); $i++){
			    $post = trn_post::findFirst($data['id'][$i]);
			    if ($post->delete() == false) {
		    		foreach ($post->getMessages() as $message) {
		        		$this->flashSession->error($message);
		        		break;
		        	}
					return $this->response->redirect("post/index&action=trash");
			    }
		    }
		}
		$this->flashSession->success(
			"Post was updated successfully"
		);
		return $this->response->redirect("post/index&action=trash");
	}


	private function validation($data)
	{
		$validation = new Validation();
		$validation->add(
		    "post_title",
			new StringLength([
			     'max' => 50,
			     'min' => 1,
			     'messageMaximum' => 'We don\'t like really long Post Title',
			     'messageMinimum' => 'We want more than just their initials'
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