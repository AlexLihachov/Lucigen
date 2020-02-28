{* vim: set ts=2 sw=2 sts=2 et: *}
{*--------------------*}
{if $active_modules.Adv_Mailchimp_Subscription}
    {*--------------------*}

    <div class="f_underlined">
        <h3 class="footer_title">{$lng.lbl_reboot_newsletter}</h3>
    </div>

    <form method="post" class="c-form--newsletter" action="mailchimp_news.php" name="subscribeform" id="subscribeform_footer">
        <input type="hidden" name="subscribe_lng" value="{$store_language|escape}" />
        <input class="c-form__input" type="email" id="semail" name="newsemail" placeholder="{$lng.lbl_email_address}" autocomplete="off">
        <button class="c-form__submit btn btn-custom1 btn-custom1--small" type="submit">Sign Up</button>

        {if $active_modules.Image_Verification and $show_antibot.on_news_panel eq 'Y'}
            {include file="modules/Image_Verification/spambot_arrest_newsletter.tpl" mode="data-table" id=$antibot_sections.on_news_panel button_code=$submit_button}
        {/if}
    </form>


    {*--------------------*}
{else}
    {*--------------------*}

    <a name="newsletter_subscribe" id="newsletter_subscribe"></a>

    <div class="f_underlined">
        <h3 class="footer_title">{$lng.lbl_reboot_newsletter}</h3>
    </div>

    <!-- Begin MailChimp Signup Form -->

    <link href="//cdn-images.mailchimp.com/embedcode/classic-081711.css" rel="stylesheet" type="text/css">
{literal}
    <style type="text/css">
        /* Add your own MailChimp form style overrides in your site stylesheet or in this style block.
           We recommend moving this block and the preceding CSS link to the HEAD of your HTML file. */
        #mc_embed_signup { background: transparent; }
        #mc_embed_signup .form-control { margin-bottom: 0; }
        #mc_embed_signup form { padding: 0; }
        #mc_embed_signup .mc-field-group { width: 100%; min-height: 40px; }
        #mc_embed_signup .mc-field-group .asterisk { top: 15px; font-size: 20px; }
        #mc_embed_signup .indicates-required { margin-bottom: 10px; }
        #mc_embed_signup .asterisk { display: inline-block; vertical-align: middle; }
        #mc-embedded-subscribe { margin: 0; }
    </style>
{/literal}

    <div id="mc_embed_signup">
        <form action="//lucigen.us1.list-manage.com/subscribe/post?u=0f261473ca5ca765434b3718f&amp;id=2a45d5959d" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
            <div id="mc_embed_signup_scroll">
                <div class="mc-field-group">
                    <label for="mce-EMAIL"><span class="asterisk">*</span></label>
                    <input type="email" value="" name="EMAIL" class="required email" id="mce-EMAIL" placeholder="Email Address">
                </div>
                <div class="mc-field-group">
                    <label for="mce-FNAME"><span class="asterisk">*</span></label>
                    <input type="text" value="" name="FNAME" class="required" id="mce-FNAME" placeholder="First Name">
                </div>
                <div class="mc-field-group">
                    <label for="mce-LNAME"><span class="asterisk">*</span></label>
                    <input type="text" value="" name="LNAME" class="required" id="mce-LNAME" placeholder="Last Name">
                </div>
                <div class="mc-field-group">
                    <input type="text" value="" name="MMERGE4" class="" id="mce-MMERGE4" placeholder="Institution">
                </div>
                <div class="indicates-required"><span class="asterisk">*</span> indicates required</div>
                <div id="mce-responses" class="clear">
                    <div class="response" id="mce-error-response" style="display:none"></div>
                    <div class="response" id="mce-success-response" style="display:none"></div>
                </div>    <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
                <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_0f261473ca5ca765434b3718f_2a45d5959d" tabindex="-1" value=""></div>
                <div class="clear">
                    <button class="btn btn-custom btn-block mt3" type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe">{$lng.lbl_subscribe}</button>
                </div>
            </div>
        </form>
    </div>
{literal}
    <script type='text/javascript' src='//s3.amazonaws.com/downloads.mailchimp.com/js/mc-validate.js'></script><script type='text/javascript'>(function($) {window.fnames = new Array(); window.ftypes = new Array();fnames[0]='EMAIL';ftypes[0]='email';fnames[1]='FNAME';ftypes[1]='text';fnames[2]='LNAME';ftypes[2]='text';fnames[3]='MMERGE3';ftypes[3]='text';fnames[4]='MMERGE4';ftypes[4]='text';fnames[5]='MMERGE5';ftypes[5]='text';fnames[6]='MMERGE6';ftypes[6]='text';fnames[7]='MMERGE7';ftypes[7]='text';fnames[8]='MMERGE8';ftypes[8]='text';fnames[9]='MMERGE9';ftypes[9]='text';fnames[10]='MMERGE10';ftypes[10]='text';fnames[11]='MMERGE11';ftypes[11]='text';fnames[12]='MMERGE12';ftypes[12]='text';fnames[13]='MMERGE13';ftypes[13]='text';fnames[14]='MMERGE14';ftypes[14]='text';fnames[15]='MMERGE15';ftypes[15]='text';fnames[16]='MMERGE16';ftypes[16]='text';fnames[17]='MMERGE17';ftypes[17]='text';fnames[18]='MMERGE18';ftypes[18]='text';fnames[19]='MMERGE19';ftypes[19]='text';}(jQuery));var $mcj = jQuery.noConflict(true);</script>
{/literal}
    <!--End mc_embed_signup-->

    {*--------------------*}
{/if}
{*--------------------*}

{if $config.Reboot.reboot_social_footer eq "Y"}

    <br>

    <div class="f_underlined">
        <h3 class="footer_title">{$lng.lbl_reboot_social}</h3>
    </div>

    <div class="social-icons centered mt20">
        {include file="custom/social_icons.tpl"}
    </div>

{/if}
