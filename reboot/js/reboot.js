$(window).load(function() {

    // Invoke Lazy Loader
    //--------------------------------------------

    $("img.lazy").unveil();

    // Override Lazy Loader for 'Hidden' Elements
    //--------------------------------------------

    $('.resp-tabs-list li, .resp-accordion').click(function() {
        $("img.lazy").trigger("unveil");
    });

    // Unify Image Thumbnails
    //--------------------------------------------

    $(".unify").imgLiquid({
        fill: true,
        useBackgroundSize: false,
        verticalAlign: 'center', // center, top or bottom
        horizontalAlign: 'center', // center, top or bottom
        fadeInTime: 250,
        delay: 100,
        ieFadeInDisabled: true
    });

});

$(document).ready(function() {

    // Descriptions Expander
    //--------------------------------------------

    $('.expander').expander({
        slicePoint: 250,
        expandText: "<span class='label label-default'>More ...</span>",
        userCollapseText: "<span class='label label-default'>... Less</span>",
        preserveWords: true,
        widow: 2,
        expandEffect: "fadeIn",
        expandSpeed: '0',
        collapseEffect: "fadeOut",
        collapseSpeed: '0'
    });

    // Scroll Panes
    //--------------------------------------------

    $('.pane50,.pane75,.pane100,.pane125,.pane150,.pane175,.pane200,.pane225,.pane250,.pane275,.pane300,.pane325,.pane350,.pane375,.pane400,.pane425,.pane450,.pane475,.pane500').jScrollPane({
        autoReinitialise: true,
        showArrows: false
    });

    // Lightbox
    //--------------------------------------------

    $('.lbox').lightbox();

    // Cloudzoom
    //--------------------------------------------

    $(".cloudzoom, .cloudzoom-blank").hover(function(){
        $('.cloudzoom-blank div:last-child').remove();
    });

    // Thumbnail Sliders
    //--------------------------------------------

    $('#thumb_slider').Thumbelina({
        orientation: "horizontal",
        easing: 10,
        maxSpeed: 10,
        $bwdBut: $('#thumb_slider .left'),
        $fwdBut: $('#thumb_slider .right')
    });

    $('#thumb_slider_alt').Thumbelina({
        orientation: "horizontal",
        easing: 10,
        maxSpeed: 10,
        $bwdBut: $('#thumb_slider_alt .left'),
        $fwdBut: $('#thumb_slider_alt .right')
    });

    // Newsletter Antispam Appear
    //--------------------------------------------

    $('form#subscribeform_footer input#semail').click(function() {
        $('#antibot_appear').slideDown('slow', function() { });
    });
    $('#antibot_disappear').click(function() {
        $('#antibot_appear').slideUp('fast', function() { });
    });

    // Scroll to Top Link
    //--------------------------------------------

    $('a.scroll_to_top, span.scroll_to_top, .divide a').click(function() {
        $('html, body').animate({ scrollTop: 0 }, 'fast');
    });

    // Floating Links - Cart Contents / Back to Top - Bottom Right
    //--------------------------------------------

    var pxShow = 300;
    var fadeInTime = 500;
    var fadeOutTime = 250;

    $(window).scroll(function() {
        if ($(window).scrollTop() >= pxShow){
            $(".floater-icons").fadeIn(fadeInTime);
        }else{
            $(".floater-icons").fadeOut(fadeOutTime);
        }
    });

    // Update Cart Total
    $(window).scroll(function() {
        var mc_totals = $("span.mc_totals").html();
        $(".floater-cart-contents span").attr("title", (mc_totals));
    });

    // Get # Items in Cart
    var mc_items = $("span.mc_items").html();

    // Tipsy Tooltips
    //--------------------------------------------

    $('.ttip_n').tipsy({ fade: false, gravity: 's', trigger: 'hover', html: true, opacity: 1 });
    $('.ttip_s').tipsy({ fade: false, gravity: 'n', trigger: 'hover', html: true, opacity: 1 });
    $('.ttip_e').tipsy({ fade: false, gravity: 'w', trigger: 'hover', html: true, opacity: 1 });
    $('.ttip_w').tipsy({ fade: false, gravity: 'e', trigger: 'hover', html: true, opacity: 1 });

    // Bootstrap Popovers
    //--------------------------------------------

    $('.popover_n').popover({ trigger: 'hover', html: true, placement: 'top' });
    $('.popover_s').popover({ trigger: 'hover', html: true, placement: 'bottom' });
    $('.popover_e').popover({ trigger: 'hover', html: true, placement: 'right' });
    $('.popover_w').popover({ trigger: 'hover', html: true, placement: 'left' });

    // v2.0 Stuff
    //--------------------------------------------

    $("ul.list-group li").addClass("list-group-item");
    $("input:not([type=hidden],[type=checkbox],[type=radio],[type=image]),select,textarea").addClass("form-control");

    // Equalise Heights of Anything
    //--------------------------------------------
    //$(".selector").equalHeights();

    // Account Sliding Menu
    //--------------------------------------------

    $('#account_sliding').dcAccordion({
        speed: 'fast',
        eventType: 'click',
        autoClose: false,
        saveState: true,
        autoExpand: false,
        disableLink: true,
        cookie: 'account_sliding',
    });

    // Carousels
    //---------------------

    // Recently Viewed
    //---------------------
    var owl_RV = $("#rv_slider");
    owl_RV.owlCarousel({
        autoPlay: false,
        slideSpeed: 500,
        paginationSpeed: 500,
        transitionStyle: "fade",
        pagination: true,
        paginationNumbers: false,
        lazyLoad: true,
        singleItem: true,
        items: 1,
        scrollPerPage: true,
        autoHeight: true,
        responsive:	true,
        mouseDrag: true,
        touchDrag: true,
        navigation: false,
        stopOnHover: true,
    });
    $(".RV_next").click(function(){ owl_RV.trigger('owl.next'); });
    $(".RV_prev").click(function(){ owl_RV.trigger('owl.prev'); });

    // Bestsellers
    //---------------------
    var owl_BS = $("#bs_slider");
    owl_BS.owlCarousel({
        autoPlay: false,
        slideSpeed: 500,
        paginationSpeed: 500,
        transitionStyle: "fade",
        pagination: true,
        paginationNumbers: false,
        lazyLoad: true,
        singleItem: true,
        items: 1,
        scrollPerPage: true,
        autoHeight: true,
        responsive:	true,
        mouseDrag: true,
        touchDrag: true,
        navigation: false,
        stopOnHover: true,
    });
    $(".BS_next").click(function(){ owl_BS.trigger('owl.next'); });
    $(".BS_prev").click(function(){ owl_BS.trigger('owl.prev'); });

    // New Arrivals
    //---------------------
    var owl_NA = $("#na_slider");
    owl_NA.owlCarousel({
        autoPlay: false,
        slideSpeed: 500,
        paginationSpeed: 500,
        transitionStyle: "fade",
        pagination: true,
        paginationNumbers: false,
        lazyLoad: true,
        singleItem: true,
        items: 1,
        scrollPerPage: true,
        autoHeight: true,
        responsive:	true,
        mouseDrag: true,
        touchDrag: true,
        navigation: false,
        stopOnHover: true,
    });
    $(".NA_next").click(function(){ owl_NA.trigger('owl.next'); });
    $(".NA_prev").click(function(){ owl_NA.trigger('owl.prev'); });

    // New Arrivals Main
    //---------------------
    var owl_NA_main = $("#na_slider_main");
    owl_NA_main.owlCarousel({
        autoPlay: false,
        slideSpeed: 500,
        paginationSpeed: 500,
        transitionStyle: "fade",
        pagination: true,
        paginationNumbers: false,
        lazyLoad: true,
        singleItem: false,
        items: 3,
        scrollPerPage: true,
        autoHeight: true,
        responsive:	true,
        mouseDrag: true,
        touchDrag: true,
        navigation: false,
        stopOnHover: true,
    });
    $(".NA_main_next").click(function(){ owl_NA_main.trigger('owl.next'); });
    $(".NA_main_prev").click(function(){ owl_NA_main.trigger('owl.prev'); });

    // Manufacturers
    //---------------------
    var owl_M = $("#m_slider");
    owl_M.owlCarousel({
        autoPlay: false,
        slideSpeed: 500,
        paginationSpeed: 500,
        transitionStyle: "fade",
        pagination: true,
        paginationNumbers: false,
        lazyLoad: true,
        singleItem: false,
        items: 4,
        scrollPerPage: true,
        autoHeight: true,
        responsive:	true,
        mouseDrag: true,
        touchDrag: true,
        navigation: false,
        stopOnHover: true,
    });
    $(".M_next").click(function(){ owl_M.trigger('owl.next'); });
    $(".M_prev").click(function(){ owl_M.trigger('owl.prev'); });

    // Banners Module
    //---------------------
    $(".banner_slider").owlCarousel({
        autoPlay: 5000,
        slideSpeed: 500,
        paginationSpeed: 500,
        transitionStyle: "fade",
        pagination: true,
        paginationNumbers: false,
        lazyLoad: true,
        singleItem: true,
        items: 1,
        scrollPerPage: true,
        autoHeight: true,
        responsive:	true,
        mouseDrag: true,
        touchDrag: true,
        navigation: false,
        stopOnHover: true,
    });

    // Multi line truncation with ellipsis for Square cards on Categories Page via Clamp Plugin
    (function () {
        var $cardsDesc = document.querySelectorAll('.square .card1 .card-content');
        var $cardsTitle = document.querySelectorAll('.square .card1 .subcat-title');
        var $window = $(window);

        function implementClamp(titleLines, descLines) {
            for (var i = 0; i < $cardsDesc.length; i++) {
                try {
                    $clamp($cardsDesc[i], {
                        clamp: descLines,
                        useNativeClamp: false
                    });

                    $clamp($cardsTitle[i], {
                        clamp: titleLines,
                        useNativeClamp: false
                    });
                } catch (e) {
                    console.log(e);
                }
            }
        }

        function setClamp() {
            if ($window.width() >= 768 && $window.width() < 992) {
                implementClamp(2, 2);
            } else if ($window.width() >= 992 && $window.width() < 1200) {
                implementClamp(2.5, 3);
            } else {
                implementClamp(3.5, 5);
            }
        }

        if (typeof($cardsDesc) !== 'undefined' && $cardsDesc != null) {
            setClamp();
        }
    }());

    (function () {
        var $menu = $('.sf-menu ul');

        $menu.wrapInner('<div class="wrapper">');
        // On prod have wrapper in Template
        // File: /lucigen/custom/header/header_menu.tpl

        var $wrapper = $('.sf-menu .wrapper');

        $wrapper.closest('li').addClass('parent');
        $wrapper.prev().addClass('sf-with-ul');
        $('.sf-menu > .parent').addClass('parent--main');


        var $parentLinks = $('.sf-menu ul li.parent');

        $('.parent--main > .sf-with-ul + .wrapper').on('mouseenter', function() {
            $(this).closest('.parent--main').addClass('active');
        });

        $('.parent--main > .sf-with-ul + .wrapper').on('mouseleave', function() {
            $(this).closest('.parent--main').removeClass('active');
        });

        $parentLinks.on('mouseenter', function () {
            $(this).addClass('active');
        });

        $parentLinks.on('mouseleave', function () {
            $(this).removeClass('active');
        });

        $parentLinks.on('mouseover', function() {
            var $menuItem = $(this),
                $submenuWrapper = $('> .wrapper', $menuItem);

            // grab the menu item's position relative to its positioned parent
            var menuItemPos = $menuItem.position();

            // place the submenu in the correct position relevant to the menu item
            $submenuWrapper.css({
                top: menuItemPos.top,
                left: menuItemPos.left + Math.round($menuItem.outerWidth() - 10)
            });
        });
    }());
});

// Windows 8 Mobile Fix
//--------------------------------------------

if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
    var msViewportStyle = document.createElement("style");
    msViewportStyle.appendChild(document.createTextNode("@-ms-viewport{width:auto!important}"));
    document.getElementsByTagName("head")[0].appendChild(msViewportStyle);
}


window.addEventListener("message", function (evt) {
    if (evt.origin === 'https://www2.lgcgroup.com' && typeof evt.data === 'string') {
        var val = +evt.data;
        var $iframe = $('#samplesIframe');
        $iframe.height(0);
        $iframe.height(val);
    }
}, false);