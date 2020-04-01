<?php


namespace app\models;


use yii\base\Model;

class Cart extends Model
{

    public function addToCart($product, $qty = 1)
    {
        $qty = ($qty == '-1') ? -1 : 1;

        if (isset($_SESSION['cart'][$product->id])){  // если есть такой то ++
            $_SESSION['cart'][$product->id]['qty']+=$qty;
        } else {                                        // если нет создать
            $_SESSION['cart'][$product->id] = [
                'title'=>$product->title,
                'price'=>$product->price,
                'qty'=>$qty,
                'img'=>$product->img,

            ];
        }
        /*общ. кол.*/
        $_SESSION['cart.qty'] =
                isset($_SESSION['cart.qty']) ? $_SESSION['cart.qty'] + $qty : $qty;

        /*общ. сумм.*/
        $_SESSION['cart.sum'] =
                isset($_SESSION['cart.sum']) ? $_SESSION['cart.sum'] + $qty*$product->price : $qty*$product->price;

        if($_SESSION['cart'][$product->id]['qty'] == 0) {
            unset($_SESSION['cart'][$product->id]);
        }
    }

    public function recalc($id)  //пересчет итогов корзины
    {
        if(!isset($_SESSION['cart'][$id])) {
            return false;
        }
        $qtyMinus = $_SESSION['cart'][$id]['qty'];
        $sumMinus = $_SESSION['cart'][$id]['qty']*$_SESSION['cart'][$id]['price'];
        $_SESSION['cart.qty']-=$qtyMinus;
        $_SESSION['cart.sum']-=$sumMinus;
        unset($_SESSION['cart'][$id]);

    }

}