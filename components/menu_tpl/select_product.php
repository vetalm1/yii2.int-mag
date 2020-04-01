<option  value="<?= $category['id'] ?>"
            <?php if($category['id'] == $this->model->category_id) echo ' selected' ?> >   <?= '' // выбор поумолчанию?>

    <?=  $tab.$category['title'] ?> <?='' //tab это отступ для подкатегорий ?>

</option>

<?php if(isset($category['children'])): ?>
    <?= $this->getMenuHtml($category['children'], $tab . '&nbsp; - ') ?>
<?php endif; ?>