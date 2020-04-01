<?php


namespace app\models;


use yii\db\ActiveRecord;

class Product extends ActiveRecord
{

    public static function tableName()
    {
        return 'product';
    }

    public function getCategory()  //get обязательно, можно потом обратиться например $product->category->title
    {
        return $this->hasOne(Category::class, ['id' => 'category_id']);
    }

}