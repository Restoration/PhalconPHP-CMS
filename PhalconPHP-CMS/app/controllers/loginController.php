<?php

use Phalcon\Mvc\Controller;
use Phalcon\Security\Random as Random;
use Phalcon\Security as Security;
use Phalcon\Validation as Validation;
use Phalcon\Validation\Validator\Email as Email;
use Phalcon\Flash\Session as FlashSession;
use Phalcon\Validation\Validator\StringLength as StringLength;
use Phalcon\Validation\Validator\PresenceOf as PresenceOf;

class LoginController extends ControllerBase
{

    public function indexAction()
    {

    }

   private function _registerSession($user)
    {
        $this->session->set(
            "auth",
            [
                "id"   => $user->id,
                "name" => $user->name,
            ]
        );
    }

	public function logoutAction()
	{
		$this->session->remove('auth');
		$this->flashSession->success('Goodbye!');
		return $this->response->redirect("login/index");
	}


	// Create Account
    public function signinAction()
    {
	    if ($this->request->isPost()) {
	        $user = new mst_user();
	        $post = $this->request->getPost("create");
			if (!$this->signinValidation($post)) {
				return $this->response->redirect("login/index");
		    }
	        // set value
	        $user->username = $post['username'];
	        $user->email = $post['email'];
	        $user->password = $this->security->hash($post['password']);
	        $user->group = 1;
	        $user->login_hash = $this->security->hash($post['username']);

			if ($user->save() === false) {
	        	foreach ($user->getMessages() as $message) {
		        	$this->flashSession->error($message);
		        }
		        return $this->response->redirect("login/index");
			}
			$this->_registerSession($user);
			return $this->response->redirect("index");
        }
		$this->flashSession->error(
			"Wrong username/Email/password"
		);
		return $this->response->redirect("login/index");
    }


	private function signinValidation($data)
	{
		$validation = new Validation();
		$validation->add(
		    "username",
		    new PresenceOf(
		        [
		            "message" => "The username is required",
		        ]
		    )
		);
		$validation->add(
		    "username",
			new StringLength([
			     'max' => 50,
			     'min' => 1,
			     'messageMaximum' => 'We don\'t like really long username',
			     'messageMinimum' => 'We want more than just their initials'
			 ])
		);
		$validation->add(
		    "email",
		    new PresenceOf(
		        [
		            "message" => "The e-mail is required",
		        ]
		    )
		);
		$validation->add(
		    "email",
		    new Email(
		        [
		            "message" => "The e-mail is not valid",
		        ]
		    )
		);
		$validation->add(
		    "password",
			new StringLength([
			     'max' => 60,
			     'min' => 6,
			     'messageMaximum' => 'We don\'t like really long password',
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

