<?php


namespace app\components;


use app\models\Category;
use yii\base\Component;

class BreadCrumbs extends Component
{
    public $breadcrumbs = [];

    public function breadcrumbs($id)
    {
        //$breadcrumbs = [];
        $category = Category::find()
                          ->select('id, parent_id, title')
                          ->indexBy('id')
                          ->asArray()->all();

        $this->crumbs($category, $id);
        $this->breadcrumbs[] = ['id'=>$category[$id]['id'], 'title'=>$category[$id]['title']];

        return $this->breadcrumbs;
    }

    public function crumbs($category, $id)
    {

        if ($category[$id]['parent_id']>0){
            $this->breadcrumbs[] =
            [
               'id' => $category[$category[$id]['parent_id']]['id'],
                'title'=>$category[$category[$id]['parent_id']]['title']
            ];
            $this->crumbs($category, $category[$id]['parent_id']);
        }
    }

}