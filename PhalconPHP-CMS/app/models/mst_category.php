<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Behavior\Timestampable as Timestampable;
use Phalcon\Db\Adapter\Pdo\Mysql as Mysql;
use Phalcon\Mvc\Model\Query;
use Phalcon\Mvc\Model\Behavior\SoftDelete;

/**
 * Category
 */
class mst_category extends Model
{
    const NOT_DELETED = '0';
    const DELETED = '1';
	public $category_id;
	public $category_name;
	public $category_slug;
	public $post_description;
	public $category_parent_id;
	public $created_at;
	public $updated_at;
	public $dltflg;

	/**
     * Category initializer
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

    public function getResult($action)
    {
		$sql = 'SELECT * FROM mst_category';
	    if(empty($action)){
		    $sql .= ' WHERE dltflg = '.mst_category::NOT_DELETED;
	    } else {
		    // Trash
			$sql .= ' WHERE dltflg = '.mst_category::DELETED;
	    }
		$query = new Query($sql,$this->getDI());
		$result = $query->execute();
		return $result;
	}
}