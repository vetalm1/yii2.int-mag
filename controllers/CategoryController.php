<?php


namespace app\controllers;


use app\models\Category;
use app\models\Product;
use yii\data\Pagination;
use yii\web\NotFoundHttpException;

class CategoryController extends AppController
{

    public function actionView($id)
    {

        $category = Category::findOne($id);
        if (empty($category)) {
            throw new NotFoundHttpException('Такой категории нет.');
        }

        $this->setMeta("{$category->title} :: ".\Yii::$app->name, $category->keywords, $category->description );

        $breadcrumbs = \Yii::$app->breadcrumbs->breadcrumbs($id);

        $query = Product::find()->where(['category_id'=>$id]);
        $pages = new Pagination([
            'totalCount'=> $query->count(),
            'pageSize' =>3,
            'forcePageParam' => false, // 
            'pageSizeParam' => false, // 
        ]);
        $products = $query->offset($pages->offset)->limit($pages->limit)->all();
        //$products = Product::find()->where(['category_id'=>$id])->all();

        return $this->render('view', compact('category', 'products',  'pages','breadcrumbs') );

    }

    public function actionSearch()
    {
        $search = trim(\Yii::$app->request->get('search'));
        $this->setMeta("Поиск {$search} :: ".\Yii::$app->name );
        if (!$search){
            return $this->render('search', compact('products',  'pages', 'search') );
        }

        $query = Product::find()->where(['like', 'title', $search]); // 
        $pages = new Pagination([
            'totalCount'=> $query->count(),
            'pageSize' =>3,
            'forcePageParam' => false,
            'pageSizeParam' => false,
        ]);
        $products = $query->offset($pages->offset)->limit($pages->limit)->all();

        return $this->render('search', compact('products',  'pages', 'search') );
    }



}