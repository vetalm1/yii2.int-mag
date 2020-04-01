<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use mihaildev\ckeditor\CKEditor;
use mihaildev\elfinder\ElFinder;
use kartik\file\FileInput;

mihaildev\elfinder\Assets::noConflict($this);

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\Product */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-form">

    <?php $form = ActiveForm::begin(); ?>

<!--    --><?//= $form->field($model, 'category_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <div class="form-group field-product-category_id has-success">
        <label class="control-label" for="product-category_id">Родительская категория</label>
        <select id="product-category_id" class="form-control" name="Product[category_id]">
            <?= \app\components\MenuWidget::widget([
                'tpl' => 'select_product', //новый шаблон
                'model' => $model,
                'cache_time' => 0,
            ]) ?>
        </select>
    </div>

    <?//= $form->field($model, 'content')->textarea(['rows' => 6])            // стандарт ?>
    <?php // echo $form->field($model, 'content')->widget(CKEditor::class,[  //Это без файл менеджера
//        'editorOptions' => [
//            'preset' => 'full', // basic, standard, full панель инструментов
//            'inline' => false, //по умолчанию false
//        ],
//    ]); ?>
    <?php echo $form->field($model, 'content')
               ->widget(CKEditor::class, ['editorOptions' => ElFinder::ckeditorOptions('elfinder',[])]);
    ?>

    <?= $form->field($model, 'price')->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'old_price')->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'description')->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'keywords')->textInput(['maxlength' => true]) ?>
    <?//= $form->field($model, 'img')->textInput(['maxlength' => true]) ?>
    <?php
        echo $form->field($model, 'file')->widget(FileInput::class, [
                                'options' => ['accept' => 'image/*'],
                                'pluginOptions' => [
                                    'showCaption' => false, //убрать название
                                    'showUpload' => false,  // убрать кн. загрузить
                                ],
    ]);
    ?>
    <?= $form->field($model, 'is_offer')->dropDownList(['Нет акции','Акция']) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
