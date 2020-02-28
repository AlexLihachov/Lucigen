{*
c863034063dde05a16bb4f2a2984f56cd779cc10, v7 (xcart_4_5_5), 2013-01-28 14:29:28, service_head.tpl, random
vim: set ts=2 sw=2 sts=2 et:
*}
{get_title page_type=$meta_page_type page_id=$meta_page_id}
{include file="customer/meta.tpl"}
{include file="customer/service_js.tpl"}
{include file="customer/service_css.tpl"}

{if $productid ne ""}
    <META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
{/if}

{literal}
    <script type="text/javascript">
        (function(a,e,c,f,g,h,b,d){var k={ak:"1071950910",cl:"6qazCOCr-3UQvtiS_wM",autoreplace:"888 575 9695"};a[c]=a[c]||function(){(a[c].q=a[c].q||[]).push(arguments)};a[g]||(a[g]=k.ak);b=e.createElement(h);b.async=1;b.src="//www.gstatic.com/wcm/loader.js";d=e.getElementsByTagName(h)[0];d.parentNode.insertBefore(b,d);a[f]=function(b,d,e){a[c](2,b,k,d,null,new Date,e)};a[f]()})(window,document,"_googWcmImpl","_googWcmGet","_googWcmAk","script");
    </script>
{/literal}

{literal}
    <!-- Hotjar Tracking Code for www.lucigen.com -->
    <script>
        (function(h,o,t,j,a,r){
            h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
            h._hjSettings={hjid:665948,hjsv:6};
            a=o.getElementsByTagName('head')[0];
            r=o.createElement('script');r.async=1;
            r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
            a.appendChild(r);
        })(window,document,'https://static.hotjar.com/c/hotjar-','.js?sv=');
    </script>
{/literal}

{literal}
    <script>
        window.dataLayer = window.dataLayer || [];
    </script>
    <!-- Google Tag Manager -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
                new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
            'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','GTM-MF9QX3B');</script>
    <!-- End Google Tag Manager -->
{/literal}

{* Reboot Template *}
{if $active_modules.Reboot}
    <link rel="shortcut icon" href="{$AltSkinDir}/ico/favicon.ico" type="image/x-icon" />
    <script src="//use.typekit.net/kjn5hfx.js"></script>
{literal}<script>try{Typekit.load();}catch(e){}</script>{/literal}
    {if $config.Reboot.reboot_favicons eq "Y"}
        {include file="custom/favicons.tpl"}
    {/if}
    {if $config.Reboot.reboot_rss_enabled_news eq "Y"}
        <link rel="alternate" type="application/rss+xml" href="{$current_location}/rss_news.xml">
    {/if}
    {if $config.Reboot.reboot_rss_enabled_products eq "Y"}
        <link rel="alternate" type="application/rss+xml" href="{$current_location}/rss_products.xml">
    {/if}
    {include file="custom/reboot_head.tpl"}
{else}
    <link rel="shortcut icon" type="image/png" href="{$current_location}/favicon.ico" />
{/if}
{* /Reboot Template *}

{if $config.SEO.canonical eq 'Y'}
    <link rel="canonical" href="{$current_location}/{$canonical_url}" />
{/if}
{if $config.SEO.clean_urls_enabled eq "Y"}
    <base href="{$catalogs.customer}/" />
{/if}

{if $active_modules.Refine_Filters}
    {include file="modules/Refine_Filters/service_head.tpl"}
{/if}

{if $active_modules.Socialize ne ""}
    {include file="modules/Socialize/service_head.tpl"}
{/if}

{if $active_modules.Lexity ne ""}
    {include file="modules/Lexity/service_head.tpl"}
{/if}

{load_defer file="modules/Lucigen_Template/reveal/reveal.css" type="css"}
{load_defer file="modules/Lucigen_Template/reveal/jquery.reveal.js" type="js"}
{load_defer file="modules/Lucigen_Template/js/jquery.accordion.js" type="js"}

{*** DigiHive.com 20181018.E ***}
{load_defer file="modules/Lucigen_Template/js/modernizr-custom.js" type="js"}
{*** End DigiHive.com 20181018.E ***}

{load_defer file="modules/Lucigen_Template/main.css" type="css"}

{*** DigiHive.com 20181018.E ***}
{load_defer file="modules/Lucigen_Template/root_categories.css" type="css"}
{*** End DigiHive.com 20181018.E ***}

{load_defer file="modules/Lucigen_Template/main.js" type="js"}

{capture name="js"}
    $(document).ready(function(){ldelim}
    LucigenLib = window.LucigenLib || {ldelim}{rdelim};
    LucigenLib.template_main = '{$main|escape:"javascript"}';
    LucigenLib.category_page = {if $main eq 'catalog' and $current_category}true{else}false{/if};
    LucigenLib.product_page = {if $main eq 'product'}true{else}false{/if};
{rdelim});
{/capture}
{load_defer file="javascript_code" direct_info=$smarty.capture.js type="js"}

{if $active_modules.Google_reCaptcha}
    {include file="modules/Google_reCaptcha/service_head.tpl"}
{/if}

{load_defer_code type="css"}
{load_defer_code type="js"}

