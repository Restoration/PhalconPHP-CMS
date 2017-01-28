<?php
use Phalcon\Di as Di;
use Phalcon\Mvc\Model as Model;
use Phalcon\Validation as Validation;
use Phalcon\Flash\Session as FlashSession;
use Phalcon\Validation\Validator\StringLength as StringLength;


class PostController extends ControllerBase
{

	public function initialize(){
		$di = new Di();
		// Set up the flash session service


    }


    public function indexAction()
    {
	    $this->view->setTemplateAfter('common');

    }

    public function editAction()
    {
	    $this->view->setTemplateAfter('common');

    }


    public function saveAction($id)
    {
	    if (!$this->request->isPost()) {
		    return $this->response->redirect("post/edit");
	    }
	    $id = $this->request->getPost("id", "int");
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

		return $this->dispatcher->forward(
			[
				"controller" => "post",
				"action"     => "index",
			]
		);
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