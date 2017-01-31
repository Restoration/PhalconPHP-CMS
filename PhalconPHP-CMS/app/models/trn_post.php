<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Behavior\Timestampable as Timestampable;
use Phalcon\Db\Adapter\Pdo\Mysql as Mysql;
use Phalcon\Mvc\Model\Query;
use Phalcon\Mvc\Model\Behavior\SoftDelete;

/**
 * Post
 */
class trn_post extends Model
{

    const NOT_DELETED = '0';
    const DELETED = '1';
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
        $this->addBehavior(new SoftDelete(
            array(
                'field' => 'dltflg',
                'value' => trn_post::DELETED,
            )
        ));
    }
    public function getResult($action)
    {
		$sql = 'SELECT * FROM trn_post';
	    if(empty($action)){
		    $sql .= ' WHERE dltflg = 0 ';
	    } else {
		    // Trash
			$sql .= ' WHERE dltflg = 1 ';
	    }

		$query = new Query($sql,$this->getDI());
		$result = $query->execute();
		return $result;
	}

}