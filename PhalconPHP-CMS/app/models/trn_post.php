<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Behavior\Timestampable as Timestampable;

/**
 * Post
 */
class trn_post extends Model
{
	public $id;
	public $user_id;
	public $post_title;
	public $post_message;
	public $created_at;
	public $updated_at;

	/**
     * Post initializer
     */
    public function initialize()
    {
        $this->addBehavior(new Timestampable(array(
            'beforeCreate' => array(
                'field' => array(
                    'created_at',
                    'updated_at'
                ),
                'format' => 'Y-m-d H:i:s'
            ),
            'beforeUpdate' => array(
                'field'  => 'updated_at',
                'format' => 'Y-m-d H:i:s'
            ),
        )));
    }
}