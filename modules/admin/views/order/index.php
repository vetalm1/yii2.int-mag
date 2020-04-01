<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Список заказов';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <?= Html::a('Добавить заказ', ['create'], ['class' => 'btn btn-success']) ?>
            </div>
            <div class="box-body">
                <div class="order-index">
                    <?= GridView::widget([
                        'dataProvider' => $dataProvider,
                        'columns' => [
                            //['class' => 'yii\grid\SerialColumn'], //нумерация

                            'id',
                            //'created_at',
                            /*[
                                'attribute' => 'created_at',
                                'format' => ['datetime', 'php:d M Y H:i:s'],
                            ],*/
                            [
                                'attribute' => 'created_at',
                                'format' => 'date', // поумолчанию из web.php
                            ],
                            'updated_at',
                            'qty',
                            'total',
                            //'status',
                            [
                                 'attribute' => 'status',
                                 'value' => function($data){
                                    return $data->status ?
                                        '<span class="text-green">Завершен</span>' :
                                        '<span class="text-red">В обработке</span>';
                                 },
                                 'format' => 'raw', // или HTML
                            ],
                            //'name',
                            //'email:email',
                            //'phone',
                            //'address',
                            //'note:ntext',

                            [
                                'class' => 'yii\grid\ActionColumn', // CRUD действия
                                'header' => 'Действия',
                            ],
                        ],
                    ]); ?>
                </div>
            </div>
        </div>
    </div>
</div>

