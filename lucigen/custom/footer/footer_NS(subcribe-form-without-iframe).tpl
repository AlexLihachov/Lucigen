{* vim: set ts=2 sw=2 sts=2 et: *}

<div class="f_underlined">
    <h3 class="footer_title">{$lng.lbl_reboot_newsletter}</h3>
</div>

<iframe src="https://www2.lgcgroup.com/l/31922/2019-03-20/gzj1mm"
        width="100%" height="78" type="text/html" frameborder="0" allowTransparency="true" style="border: 0"></iframe>

{*{if $active_modules.Image_Verification and $show_antibot.on_news_panel eq 'Y'}*}
    {*{include file="modules/Image_Verification/spambot_arrest_newsletter.tpl" mode="data-table" id=$antibot_sections.on_news_panel button_code=$submit_button}*}
{*{/if}*}