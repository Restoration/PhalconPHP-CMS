<?php

class readmeController extends ControllerBase
{

    public function indexAction()
    {
	    $this->view->setTemplateAfter('common');
	    $content = file_get_contents('https://raw.githubusercontent.com/Restoration/PhalconPHP-CMS/master/README.md');
	    $this->view->setVar("content",$content);
    }
}

