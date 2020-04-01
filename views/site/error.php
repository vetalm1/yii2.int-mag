<?php

/* @var $this yii\web\View */
/* @var $name string */
/* @var $message string */
/* @var $exception Exception */

use yii\helpers\Html;

$this->title = $name;
?>

<!-- banner -->
<div class="banner">
    <?= $this->render('//layouts/inc/sidebar') //подключение сайдбара из файла sidebar.php ?>

    <div class="w3l_banner_nav_right">
        <div style="padding: 0 1em; ">
            <h3><?= Html::encode($this->title) ?></h3>
            <div class="alert alert-danger">
                <?= nl2br(Html::encode($message)) ?>
            </div>
            <p>Если вы нашли ошибку, сообщите нам.</p>
        </div>
    </div>
    <div class="clearfix"></div>
</div>


<!--<div class="site-error">-->
<!---->
<!--    <h1>--><?//= Html::encode($this->title) ?><!--</h1>-->
<!---->
<!--    <div class="alert alert-danger">-->
<!--        --><?//= nl2br(Html::encode($message)) ?>
<!--    </div>-->
<!---->
<!--    <p>-->
<!--        The above error occurred while the Web server was processing your request.-->
<!--    </p>-->
<!--    <p>-->
<!--        Please contact us if you think this is a server error. Thank you.-->
<!--    </p>-->
<!---->
<!--</div>-->
