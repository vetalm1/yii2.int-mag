<?php

namespace app\modules\admin\models;

use Yii;
use yii\web\UploadedFile;

/**
 * This is the model class for table "product".
 *
 * @property int $id
 * @property int $category_id
 * @property string $title
 * @property string $content
 * @property float $price
 * @property float $old_price
 * @property string|null $description
 * @property string|null $keywords
 * @property string $img
 * @property int $is_offer
 */
class Product extends \yii\db\ActiveRecord
{
    public $file;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['category_id', 'title', 'content'], 'required'],
            [['category_id', 'is_offer'], 'integer'],
            [['content'], 'string'],
            [['price', 'old_price'], 'number'],
            [['price', 'old_price'], 'default', 'value'=>0 ],
            [['img'], 'default', 'value'=>'products-img/no-image.png'],
            [['title', 'description', 'keywords', 'img'], 'string', 'max' => 255],
            [['file'], 'image'],
        ];
    }

    public function getCategory(){
        return $this->hasOne(Category::class, ['id' =>'category_id']);
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'category_id' => 'Category ID',
            'title' => 'Наименование',
            'content' => 'Content',
            'price' => 'Цена',
            'old_price' => 'Старая цена',
            'description' => 'Описание',
            'keywords' => 'Кейворд',
            'file' =>'Фото',
            'img' => 'Img',
            'is_offer' => 'Is Offer',
        ];
    }

    public function beforeSave($insert)
    {
        if ($file = UploadedFile::getInstance($this, 'file')) { //this-model atribute-'file' from form_post
            $dir = 'products-img/'.date("Y-m-d").'/'; //dir - дата создания
            if(!is_dir($dir)){
                mkdir($dir);
            }
            $file_name = uniqid().'_'.$file->baseName.'.'.$file->extension;
            $this->img = $dir.$file_name;
            $file->saveAs($this->img);
        }
        return parent::beforeSave($insert);
    }
}
