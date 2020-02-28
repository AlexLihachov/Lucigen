{* vim: set ts=2 sw=2 sts=2 et: *}
{* ---------------------------------------------------- *}
{* X-CART REBOOT TEMPLATE v4.6.x - www.xcartmods.co.uk *}
{* ---------------------------------------------------- *}
{assign var="AltSkinDir" value="skin/reboot"}
{assign var="AltImagesDir" value="skin/reboot/images"}
<!DOCTYPE html>
{config_load file="$skin_config"}
<html lang="en"{if $main eq "product"} itemscope itemtype="http://schema.org/Product"{/if}>
    <head>
        <meta charset="utf-8" />
        {include file="customer/service_head.tpl"}
    </head>
    <body{if $body_onload ne ''} onload="javascript: {$body_onload}"{/if}>

        {literal}
            <!-- Google Tag Manager (noscript) -->
            <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MF9QX3B"
                              height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
            <!-- End Google Tag Manager (noscript) -->
        {/literal}

        {*
        {include file="customer/header_special.tpl"}
        *}

        {if $active_modules.EU_Cookie_Law}
            {include file="modules/EU_Cookie_Law/info_panel.tpl"}
        {/if}

        {capture name=seotitle}{get_title page_type=$meta_page_type page_id=$meta_page_id}{/capture}

        {*-------------------------------------------------*}

        {if $config.Reboot.reboot_full_width ne "Y"}
        <div class="container">
            {/if}

            {include file="custom/header/header_style_`$config.Reboot.reboot_header_style`.tpl"}

            {if $active_modules.Socialize and ($config.Socialize.soc_fb_like_enabled eq "Y" or $config.Socialize.soc_fb_send_enabled eq "Y")}
                <div id="fb-root"></div>
            {/if}

            {include file="custom/content.tpl"}

            {include file="custom/footer/footer_style_`$config.Reboot.reboot_footer_style`.tpl"}

            {if $config.Reboot.reboot_full_width ne "Y"}
        </div>
        {/if}

        {*-------------------------------------------------*}

        {if $active_modules.SnS_connector}
            {include file="modules/SnS_connector/header.tpl"}
        {/if}

        {if $active_modules.Google_Analytics}
            {include file="modules/Google_Analytics/ga_code_async.tpl"}
        {/if}

        {*-------------------------------------------------*}

        {if $config.Reboot.reboot_floating_icons ne ""}
            {include file="custom/floater_icons.tpl"}
        {/if}

        {if $config.Reboot.reboot_themes ne "Y" && $config.Reboot.reboot_side_panel eq "Y"}
            {include file="custom/side_panel.tpl"}
        {/if}

        {if $config.Reboot.reboot_themes eq "Y" && $config.Reboot.reboot_side_panel ne "Y"}
            {include file="custom/theme_panel.tpl"}
        {/if}

        {if $config.Reboot.reboot_helpers eq "Y"}
            {include file="custom/helpers.tpl"}
        {/if}

        {*-------------------------------------------------*}

        {include file="custom/reboot_js.tpl"}

        {*-------------------------------------------------*}

        {load_defer_code type="js"}
        {include file="customer/service_body_js.tpl"}
        {load_defer_code type="css"}

        {*-------------------------------------------------*}

        {if $config.Reboot.reboot_feedback ne ""}
            {include file="custom/feedback.tpl"}
        {/if}

        {include file="modules/Lucigen_Template/bottom.tpl"}

        {literal}
            <script id="Cookiebot" src="https://consent.cookiebot.com/uc.js" data-cbid="efd6e04c-422c-4538-88aa-13a2a977cd91" type="text/javascript" async></script>
            <script type="text/javascript">
                piAId = '32922';
                piCId = '76063';
                piHostname = 'pi.pardot.com';

                (function() {
                    function async_load(){
                        var s = document.createElement('script'); s.type = 'text/javascript';
                        s.src = ('https:' == document.location.protocol ? 'https://pi' : 'http://cdn') + '.pardot.com/pd.js';
                        var c = document.getElementsByTagName('script')[0]; c.parentNode.insertBefore(s, c);
                    }
                    if(window.attachEvent) { window.attachEvent('onload', async_load); }
                    else { window.addEventListener('load', async_load, false); }
                })();
            </script>
        {/literal}

    </body>
</html>

