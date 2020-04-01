<?php


namespace app\components;


use app\models\Category;
use yii\base\Widget;

class MenuWidget extends Widget
{

    public $tpl;
    public $ul_class; //класс тега <ul>
    public $data;  // данные которы передаем в виджет
    public $tree; //массив дерево меню
    public $menuHtml;  // готовый хтмл код
    public $model;
    public $cache_time = 60;

    public function init()
    {
        parent::init();
        if($this->ul_class === null){
            $this->ul_class = 'menu';
        }
        if($this->tpl === null){
            $this->tpl = 'menu';
        }
        $this->tpl .= '.php';
    }

    public function run()
    {
        // get cache забираем данные из кэш
        if ($this->cache_time) {
            $menu = \Yii::$app->cache->get('menu');
            if($menu){
                return $menu;
            }
         };

        $this->data = Category::find()->
                                select('id, parent_id, title')->indexBy('id')->asArray()->all();
        //indexBy - чтобы id стал индексом массива
        $this->tree = $this->getTree();
        $this->menuHtml = '<ul class="' . $this->ul_class . '">';
        $this->menuHtml .= $this->getMenuHtml($this->tree);
        $this->menuHtml .= '</ul>';

       // set cache помещаем данные в кэш
        if ($this->cache_time) {
            \Yii::$app->cache->set('menu', $this->menuHtml, $this->cache_time);
        }
        return $this->menuHtml;
    }

    protected function getTree(){
            $tree = [];
            foreach ($this->data as $id=>&$node) {
                if (!$node['parent_id'])
                    $tree[$id] = &$node;
                else
                    $this->data[$node['parent_id']]['children'][$node['id']] = &$node;
            }                // если не 0 создаем дочерний эл-т и вкладываем в него узел
            return $tree;
    }

    protected function getMenuHtml($tree, $tab=''){
        $str = '';
        foreach ($tree as $category) {
            $str .= $this->catToTemplate($category, $tab);
        }
        return $str;
    }

    protected function catToTemplate($category, $tab){
        ob_start(); // буферизация вывода
        include __DIR__ . '/menu_tpl/' . $this->tpl; // помещаем в шаблон категорию, но не выводим на экран
        return ob_get_clean();
    }

}