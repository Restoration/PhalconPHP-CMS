<?php

use Phalcon\Mvc\Model as Model;
use Phalcon\Mvc\Model\Behavior\Timestampable as Timestampable;
use Phalcon\Db\Adapter\Pdo\Mysql as Mysql;
use Phalcon\Mvc\Model\Query;
use Phalcon\Mvc\Model\Behavior\SoftDelete;

/**
 * User
 */
class mst_user extends Model
{

    const NOT_DELETED = '0';
    const DELETED = '1';
	public $id;
	public $email;
	public $password;
	public $group;
	public $last_login;
	public $login_hash;
	public $profile_fields;
	public $created_at;
	public $updated_at;
	public $dltflg;

	/**
     * User initializer
     */
    public function initialize()
    {
        $this->addBehavior(new Timestampable(array(
            'beforeValidationOnCreate' => array(
                'field' => array(
                    'last_login',
                    'created_at',
                    'updated_at'
                ),
                'format' => 'Y-m-d H:i:s'
            ),
            'beforeValidationOnUpdate' => array(
                'field' => array(
                    'updated_at'
                ),
                'format' => 'Y-m-d H:i:s'
            ),
        )));
    }
}