
<option
    value="<?= $category['id'] ?>"
    <?php if($category['id'] == $this->model->parent_id) echo ' selected' ?> // выбор поумолчанию
    <?php if($category['id'] == $this->model->id) echo ' disabled' ?>  // убрать возможность выбора самой себя в качестве род категории.
>
    <?=  $tab.$category['title'] ?> <?='' //tab это отступ для подкатегорий ?>
</option>

<?php if(isset($category['children'])): ?>
    <?= $this->getMenuHtml($category['children'], $tab . '&nbsp; - ') ?>
<?php endif; ?>