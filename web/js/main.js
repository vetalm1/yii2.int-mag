jQuery(document).ready(function($) {
    $(".scroll").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
    });

    var navoffeset=$(".agileits_header").offset().top;
    $(window).scroll(function(){
        var scrollpos=$(window).scrollTop();
        if(scrollpos >=navoffeset){
            $(".agileits_header").addClass("fixed");
        }else{
            $(".agileits_header").removeClass("fixed");
        }
    });

    $(".dropdown").hover(
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');
        }
    );

    /*
    var defaults = {
    containerID: 'toTop', // fading element id
    containerHoverID: 'toTopHover', // fading element hover id
    scrollSpeed: 1200,
    easingType: 'linear'
    };
*/
    $().UItoTop({ easingType: 'easeOutQuart' });

    $('#example').okzoom({
        width: 150,
        height: 150,
        border: "1px solid black",
        shadow: "0 0 5px #000"
    });

});


$(window).load(function(){
    $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
            $('body').removeClass('loading');
        }
    });
});

paypal.minicart.render();

paypal.minicart.cart.on('checkout', function (evt) {
    var items = this.items(),
        len = items.length,
        total = 0,
        i;

    // Count the number of each item in the cart
    for (i = 0; i < len; i++) {
        total += items[i].get('quantity');
    }

    if (total < 3) {
        alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
        evt.preventDefault();
    }
});

/* Cart */

function showCart(cart){
    $('#modal-cart .modal-body').html(cart);
    $('#modal-cart').modal();
    let cartSum = $('#cart-sum').text() ? $('#cart-sum').text() : '$0';
    if(cartSum){
        $('.cart-sum').text(cartSum);
    }
}

function getCart(){
    $.ajax({
        url: 'cart/show',
        type: 'GET',
        success: function (res) {
            if(!res) alert('Ошибка');
            showCart(res);
        },
        error: function(){
            alert('Error!');
        }
    });
}

/* addToCart */
$('.add-to-cart').on('click', function () {
    let id = $(this).data('id');
    $.ajax({
        url: 'cart/add',
        data: {id: id},
        type: 'GET',
        success: function (res) {
            if(!res) alert('Ошибка');
            showCart(res);
        },
        error: function(){
            alert('Error!');
        }
    });
    return false; // отмена срабатывания ссылки по дефолту
});

/* del-Item-From-Cart */
$('#modal-cart .modal-body').on('click', '.del-item', function () { //деллегируем события del-item т.к. они дабавл. ассинхр.
    let id = $(this).data('id');
    $.ajax({
        url: 'cart/del-item', //незабывать тире
        data: {id: id},
        type: 'GET',
        success: function (res) {
            if(!res) alert('Ошибка');
            let  now_location = document.location.pathname;
            if (now_location == '/cart/checkout'){
                location = 'cart/checkout'; //перейти по данному пути
            }
            showCart(res);
        },
        error: function(){
            alert('Error!');
        }
    });
});

/*add or remove qty product in checkout*/
$('.value-plus, .value-minus').on('click', function () {
    let id=$(this).data('id');
    let qty=$(this).data('qty');
    $('cart-table.overlay').fadeIn(); // оверлей до завершения операции
    $.ajax({
        url: 'cart/change-cart', //незабывать тире
        data: {id: id, qty: qty},
        type: 'GET',
        success: function (res) {
            if(!res) alert('Error product')
                location = 'cart/checkout';
        },
        error: function(){
            alert('Error!');
        }
    })

})


function clearCart() {
    $.ajax({
        url: 'cart/clear',
        type: 'GET',
        success: function (res) {
            if(!res) alert('Ошибка');
            showCart(res);
        },
        error: function(){
            alert('Error!');
        }
    });
}

/* Cart */

