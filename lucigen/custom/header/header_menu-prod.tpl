{*
vim: set ts=2 sw=2 sts=2 et:
*}
<div id="xmm_sticky">
  <div id="xmm">
    <div id="xmm_container">

      <ul class="sf-menu" id="resp_menu">

        {if $config.Reboot.reboot_header_menu_home eq "Y"}
        <li><a href="./"><i class="fa fa-home mr5"></i>{$lng.lbl_reboot_home}</a></li>
        {/if}

        {*--------------------------------------*}
        {if $config.Reboot.reboot_header_menu eq "dropdown"}
        {*--------------------------------------*}

        <li>
          <a href="{$xcart_web_dir}/products">Products</a>
          {include file="custom/header/categories.tpl" categories=$categories_menu_list root=true}
        </li>

        <li>
          <a href="{$xcart_web_dir}/#">Services</a>
          <div class="wrapper"><ul>
            <li><a href="{$xcart_web_dir}/genome-closure-services">NGS Services</a></li>
            <li><a href="home.php?cat=115">Custom Competent Cell Services</a></li>
          </ul></div>
        </li>

        <li>
          <a href="{$xcart_web_dir}/#">Resources</a>
          <div class="wrapper"><ul>
            {* <li><a href="/application-notes.html">Application Notes</a></li> *}
            <li><a href="/Citations.html">Citations</a></li>
            <li><a href="/faqs.html">FAQs</a></li>
            <li><a href="{$xcart_web_dir}/Product-Flyers.html">Flyers</a></li>
            {*<li><a href="{$xcart_web_dir}/Publications-by-Lucigen-Scientists.html">Lucigen Publications</a></li> *}
            <li><a href="{$xcart_web_dir}/Product-Manuals.html">Manuals</a></li>
          {*  <li><a href="{$xcart_web_dir}/Selection-Guides.html">Product Selection Guides</a></li> *}
            <li><a href="{$xcart_web_dir}/Scientific-Posters.html">Scientific Posters</a></li>
            <li><a href="pages.php?pageid=171">SDS Documents</a></li>
            <li><a href="pages.php?pageid=167">Support Files</a></li>
            <li><a href="{$xcart_web_dir}/Vector-Sequences.html">Vector Sequences</a></li>
            <li><a href="{$xcart_web_dir}/webinars">Webinars</a></li>
            {* FS - New resource in product categories # 86965 *}
            <li><a href="/white_papers-molecular-biology.html">{$lng.lbl_white_papers}</a></li>
            {* FS - New resource in product categories # 86965 *}
          </ul></div>
        </li>

        <li>
          <a href="{$xcart_web_dir}/#">Support</a>
          <div class="wrapper"><ul>
            <li><a href="{$xcart_web_dir}/Ordering-Information.html">Ordering &amp; Shipping Information</a></li>
            <li><a href="{$xcart_web_dir}/Customer-Technical-Support">Customer &amp; Technical Support </a></li>
            <li><a href="{$xcart_web_dir}/Privacy-Policy.html">Privacy Policy </a></li>
            <li><a href="{$xcart_web_dir}/Legal-Information.html">Legal Information </a></li>
          </ul></div>
        </li>

        <li>
          <a href="pages.php?pageid=139">OEM</a>
        </li>

        <li>
          <a href="{$xcart_web_dir}/Distributors.html">Distributors</a>
        </li>

        <li>
          <a href="{$xcart_web_dir}/#">Company</a>
          <div class="wrapper"><ul>
            <li><a href="pages.php?pageid=2">Overview</a></li>
            <li><a href="pages.php?pageid=9">News</a></li>
            <li><a href="pages.php?pageid=10">Careers</a></li>
            <li><a href="pages.php?pageid=140">ISO 13485</a></li>
          </ul></div>
        </li>

        <li class="fright">
          <a href="#sub" class="arrow"><i class="fa fa-user"></i> {if $login eq ''}{$lng.lbl_reboot_account}{else}{$fullname|default:$login|escape}{/if}</a>
          <div class="wrapper"><ul>
            {if $login eq ''}
            <li>{include file="customer/main/login_link.tpl"}</li>
            <li><a href="help.php?section=Password_Recovery">{$lng.lbl_forgot_password}</a></li>
            <li><a href="register.php">{$lng.lbl_register}</a></li>
            {else}
            <li><a href="register.php?mode=update">{$lng.lbl_my_account}</a></li>
            {/if}

            {if $active_modules.Wishlist and $wlid ne ""}
            <li><a href="cart.php?mode=friend_wl&amp;wlid={$wlid|escape}">{$lng.lbl_friends_wish_list}</a></li>
            {/if}

            {if $active_modules.Wishlist}
            <li><a href="cart.php?mode=wishlist">{$lng.lbl_wish_list}</a></li>
            {/if}

            {if $active_modules.Gift_Registry}
            <li><a href="giftreg_manage.php">{$lng.lbl_gift_registry}</a></li>
            {/if}

            {if $active_modules.Quick_Reorder}
            <li><a href="quick_reorder.php">{$lng.lbl_quick_reorder_customer}</a></li>
            {/if}

            {if $login ne ''}
            <li><a href="login.php?mode=logout">{$lng.lbl_logoff}</a></li>
            {/if}

            <li><a href="#sub" class="arrow">{$lng.lbl_help}</a>
              <ul class="open-left">
                {foreach from=$pages_menu item=p}
                {if $p.show_in_menu eq 'Y'}
                <li><a href="pages.php?pageid={$p.pageid}">{$p.title|amp}</a></li>
                {/if}
                {/foreach}
                <li><a href="help.php?section=contactus&amp;mode=update">{$lng.lbl_contact_us}</a></li>
              </ul></div>
            </li>

          </ul></div>
        </li>

        {*--------------------------------------*}
        {elseif $config.Reboot.reboot_header_menu eq "mega"}
        {*--------------------------------------*}

        <li class="header-categories-menu">
          <a href="{$xcart_web_dir}/products">Products</a>
          <div class="sf-mega">
            {include file="custom/header/categories.tpl" categories=$categories_menu_list root=true}
          </div>
        </li>

        <li>
          <a href="{$xcart_web_dir}/#">Services</a>
        </li>

        <li>
          <a href="{$xcart_web_dir}/#">Resources</a>
          <div class="sf-mega clearer">
            <div class="header-column-menu clearer">
              <div class="fleft">
                {* <div><a href="{$xcart_web_dir}/eLucidations-application-notes.html">Application Notes</a></div> *}
                <div><a href="{$xcart_web_dir}/Citations.html">Citations</a></div>
                <div><a href="{$xcart_web_dir}/Publications-by-Lucigen-Scientists.html">Lucigen Publications</a></div>
                <div><a href="{$xcart_web_dir}/docs/msds/MSDS.pdf">MSDS</a></div>
              </div>
              <div class="fleft">
                <div><a href="{$xcart_web_dir}/Product-Flyers.html">Product Flyers</a></div>
                <div><a href="{$xcart_web_dir}/Product-Manuals.html">Product Manuals</a></div>
                <div><a href="{$xcart_web_dir}/Selection-Guides.html">Product Selection Guides</a></div>
              </div>

              <div class="fleft">
                <div><a href="{$xcart_web_dir}/Scientific-Posters.html">Scientific Posters</a></div>
                <div><a href="{$xcart_web_dir}/Vector-Sequences.html">Vector Sequences</a></div>
                <div><a href="{$xcart_web_dir}/webinars">Webinars</a></div>
              </div>
            </div>
          </div>
        </li>

        <li>
          <a href="{$xcart_web_dir}/">Support</a>
          <div class="sf-mega clearer">
            <div class="header-column-menu clearer">
              <div class="fleft">
                <div><a href="{$xcart_web_dir}/Ordering-Information.html">Ordering &amp; Shipping Information</a></div>
                <div><a href="{$xcart_web_dir}/Customer-Technical-Support">Customer &amp; Technical Support </a></div>
                <div><a href="{$xcart_web_dir}/Distributors.html">International Distributors</a></div>
              </div>
              <div class="fleft">
                <div><a href="{$xcart_web_dir}/Privacy-Policy.html">Privacy Policy </a></div>
                <div><a href="{$xcart_web_dir}/Legal-Information.html">Legal Information </a></div>
              </div>
            </div>
          </div>
        </li>

        <li>
          <a href="pages.php?pageid=148">Molecular Diagnostics</a>
        </li>

        <li class="fright"><a href="#sub" class="arrow"><i class="fa fa-user"></i> {if $login eq ''}{$lng.lbl_reboot_account}{else}{$fullname|default:$login|escape}{/if}</a>
          <div class="sf-mega">
            <div class="wrapper"><ul>
              {if $login eq ''}
              <li>{include file="customer/main/login_link.tpl"}</li>
              <li><a href="help.php?section=Password_Recovery">{$lng.lbl_forgot_password}</a></li>
              <li><a href="register.php">{$lng.lbl_register}</a></li>
              {else}
              <li><a href="register.php?mode=update">{$lng.lbl_my_account}</a></li>
              {/if}

              {if $active_modules.Wishlist and $wlid ne ""}
              <li><a href="cart.php?mode=friend_wl&amp;wlid={$wlid|escape}">{$lng.lbl_friends_wish_list}</a></li>
              {/if}

              {if $active_modules.Wishlist}
              <li><a href="cart.php?mode=wishlist">{$lng.lbl_wish_list}</a></li>
              {/if}

              {if $active_modules.Gift_Registry}
              <li><a href="giftreg_manage.php">{$lng.lbl_gift_registry}</a></li>
              {/if}

              {if $active_modules.Quick_Reorder}
              <li><a href="quick_reorder.php">{$lng.lbl_quick_reorder_customer}</a></li>
              {/if}

              {if $login ne ''}
              <li><a href="login.php?mode=logout">{$lng.lbl_logoff}</a></li>
              {/if}

              <li><a href="#sub" class="arrow">{$lng.lbl_help}</a>
                <div class="wrapper"><ul>
                  {foreach from=$pages_menu item=p}
                  {if $p.show_in_menu eq 'Y'}
                  <li><a href="pages.php?pageid={$p.pageid}">{$p.title|amp}</a></li>
                  {/if}
                  {/foreach}
                  <li><a href="help.php?section=contactus&amp;mode=update">{$lng.lbl_contact_us}</a></li>
                </ul></div>
              </li>

              <li><a href="pages.php?pageid=29">Ordering Information</a></li>

            </ul></div>
          </div>
        </li>

        {*--------------------------------------*}
        {elseif $config.Reboot.reboot_header_menu eq "speedbar"}
        {*--------------------------------------*}

        {if $config.Reboot.reboot_menu_speedbar_cats eq "Y"}
        <li><a href="#">{$lng.lbl_categories}</a>
          <div class="wrapper"><ul>
            {foreach from=$categories_menu_list item=c}
            <li><a href="home.php?cat={$c.categoryid}">{$c.category}{if $config.Reboot.reboot_header_count eq "Y" && $c.top_product_count gt 0}&nbsp;<span class="badge">{$c.top_product_count}</span>{/if}</a>
              {if $c.childs}
              {foreach from=$c.childs item=sc name=sc}
              {if $smarty.foreach.sc.first}<div class="wrapper"><ul>{/if}
                <li><a href="home.php?cat={$sc.categoryid}">{$sc.category}{if $config.Reboot.reboot_header_count eq "Y" && $sc.top_product_count gt 0}&nbsp;<span class="badge">{$sc.top_product_count}</span>{/if}</a>
                  {if $sc.childs}
                  {foreach from=$sc.childs item=ssc name=ssc}
                  {if $smarty.foreach.ssc.first}<div class="wrapper"><ul>{/if}
                    <li><a href="home.php?cat={$ssc.categoryid}">{$ssc.category}{if $config.Reboot.reboot_header_count eq "Y" && $ssc.top_product_count gt 0}&nbsp;<span class="badge">{$ssc.top_product_count}</span>{/if}</a>
                      {if $ssc.childs}
                      {foreach from=$ssc.childs item=sssc name=sssc}
                      {if $smarty.foreach.sssc.first}<div class="wrapper"><ul>{/if}
                        <li><a href="home.php?cat={$sssc.categoryid}">{$sssc.category}{if $config.Reboot.reboot_header_count eq "Y" && $sssc.top_product_count gt 0}&nbsp;<span class="badge">{$sssc.top_product_count}</span>{/if}</a>
                          {if $sssc.childs}
                          {foreach from=$sssc.childs item=ssssc name=ssssc}
                          {if $smarty.foreach.ssssc.first}<div class="wrapper"><ul>{/if}
                            <li><a href="home.php?cat={$ssssc.categoryid}">{$ssssc.category}{if $config.Reboot.reboot_header_count eq "Y" && $ssssc.top_product_count gt 0}&nbsp;<span class="badge">{$ssssc.top_product_count}</span>{/if}</a></li>
                            {if $smarty.foreach.ssssc.last}</ul></div>{/if}
                          {/foreach}
                          {/if}
                        </li>
                        {if $smarty.foreach.sssc.last}</ul></div>{/if}
                      {/foreach}
                      {/if}
                    </li>
                    {if $smarty.foreach.ssc.last}</ul></div>{/if}
                  {/foreach}
                  {/if}
                </li>
                {if $smarty.foreach.sc.last}</ul></div>{/if}
              {/foreach}
              {/if}
            </li>
            {/foreach}
          </ul></div>
          <li>
            {/if}

            {section loop=$speed_bar name=sb step=-1}
            <li><a href="{$speed_bar[sb].link|amp}">{$speed_bar[sb].title}</a></li>
            {/section}

            {*--------------------------------------*}
            {elseif $config.Reboot.reboot_header_menu eq "custom"}
            {*--------------------------------------*}

            {include file="custom/header/header_menu_custom.tpl"}

            {*--------------------------------------*}
            {/if}
            {*--------------------------------------*}

            {if ($config.Reboot.reboot_header_menu_SP eq "Y") && ($config.Reboot.reboot_header_menu eq "dropdown" || $config.Reboot.reboot_header_menu eq "speedbar" || $config.Reboot.reboot_header_menu eq "custom")}
            <li><a href="help.php"><i class="fa fa-question-circle mr5"></i>{$lng.lbl_help}</a>
              <div class="wrapper"><ul>
                {foreach from=$pages_menu item=p name=page}
                {if $p.show_in_menu eq 'Y'}
                <li><a href="pages.php?pageid={$p.pageid}">{$p.title|amp}</a></li>
                {/if}
                {/foreach}
              </ul></div>
            </li>
            {/if}

            {*--------------------------------------*}

            {if $main ne "cart" && ($active_modules.Manufacturers ne "" && $config.Reboot.reboot_header_menu_manufs eq "Y") && ($config.Reboot.reboot_header_menu eq "dropdown" || $config.Reboot.reboot_header_menu eq "speedbar" || $config.Reboot.reboot_header_menu eq "custom")}
            <li><a href="manufacturers.php"><i class="fa fa-tags mr5"></i>{$lng.lbl_manufacturers}</a>
              <div class="wrapper"><ul>
                {foreach from=$manufacturers_menu item=m}
                <li><a href="manufacturers.php?manufacturerid={$m.manufacturerid}">{$m.manufacturer|amp}</a></li>
                {/foreach}
                {if $show_other_manufacturers}
                <li><a href="manufacturers.php">{$lng.lbl_other_manufacturers}</a></li>
                {else}
                <li><a href="manufacturers.php">{$lng.lbl_all} {$lng.lbl_manufacturers}...</a></li>
                {/if}
              </ul></div>
            </li>
            {/if}

            {*--------------------------------------*}

      </ul></div>

    </div>
  </div>
</div>

{*--------------------------------------*}
{if $config.Reboot.reboot_header_menu eq "mega"}
{*--------------------------------------*}

<div id="xmm_container_mega" style="height:0;visibility:hidden;">
  <ul class="sf-menu" id="resp_menu">


    {if $config.Reboot.reboot_header_menu_home eq "Y"}
    <li><a href="./">{$lng.lbl_reboot_home}</a></li>
    {/if}


    <li>
      <a href="{$xcart_web_dir}/products">Products</a>
      <div>
        {include file="custom/header/categories.tpl categories=$categories_menu_list root=true}
      </div>
    </li>


    {foreach from=$categories_menu_list item=c}
    <li><a href="home.php?cat={$c.categoryid}">{$c.category}</a>
      {if $c.childs}
      {foreach from=$c.childs item=sc name=sc}
      {if $smarty.foreach.sc.first}<div class="wrapper"><ul>{/if}
        <li><a href="home.php?cat={$sc.categoryid}">{$sc.category}</a>
          {if $sc.childs}
          {foreach from=$sc.childs item=ssc name=ssc}
          {if $smarty.foreach.ssc.first}<div class="wrapper"><ul>{/if}
            <li><a href="home.php?cat={$ssc.categoryid}">{$ssc.category}</a></li>
            {if $smarty.foreach.ssc.last}</ul></div>{/if}
          {/foreach}
          {/if}
        </li>
        {if $smarty.foreach.sc.last}</ul></div>{/if}
      {/foreach}
      {/if}
    </li>
    {/foreach}

    {if $active_modules.Manufacturers ne "" && $config.Reboot.reboot_header_menu_manufs eq "Y"}
    <li><a href="manufacturers.php"><i class="fa fa-tags mr5"></i>{$lng.lbl_manufacturers}</a>
      <div class="wrapper"><ul>
        {foreach from=$manufacturers_menu item=m}
        <li><a href="manufacturers.php?manufacturerid={$m.manufacturerid}">{$m.manufacturer}</a></li>
        {/foreach}
        <li><a href="manufacturers.php">{$lng.lbl_more}</a></li>
      </ul></div>
    </li>
    {/if}

    {if $config.Reboot.reboot_header_menu_SP eq "Y"}
    <li><a href="help.php"><i class="fa fa-question-circle mr5"></i>{$lng.lbl_help}</a>
      <div class="wrapper"><ul>
        {foreach from=$pages_menu item=p name=page}
        {if $p.show_in_menu eq 'Y'}
        <li><a href="pages.php?pageid={$p.pageid}">{$p.title|amp}</a></li>
        {/if}
        {/foreach}
      </ul></div>
    </li>
    {/if}

  </ul></div>
</div>

{*--------------------------------------*}
{/if}
{*--------------------------------------*}

<div class="mobile-menu"></div>
<div class="clearing"></div>

{literal}
<script>
$(document).ready(function() {
  {/literal}{if $config.Reboot.reboot_menu_sticky eq "Y"}{literal}
  $("#xmm").sticky({
    topSpacing: 0,
    bottomSpacing: 0,
    center: false,
    getWidthFrom: '#xmm_sticky',
  });
  {/literal}{/if}{literal}
  {/literal}{if $config.Reboot.reboot_header_menu eq "dropdown" || $config.Reboot.reboot_header_menu eq "custom" || $config.Reboot.reboot_header_menu eq "mega" || ($config.Reboot.reboot_header_menu eq "speedbar" && $config.Reboot.reboot_menu_speedbar_cats eq "Y")}{literal}

  {/literal}{/if}{literal}
  {/literal}{if $config.Reboot.reboot_menu_responsive eq "Y"}{literal}
  $('#xmm_container{/literal}{if $config.Reboot.reboot_header_menu eq "mega"}_mega{/if}{literal}').meanmenu({
    meanScreenWidth: "{/literal}{$config.Reboot.reboot_menu_responsive_width}{literal}",
    meanSticky: {/literal}{if $config.Reboot.reboot_menu_responsive_sticky eq "Y"}true{else}false{/if}{literal},
    meanLabel: "{/literal}{$lng.lbl_reboot_menu}{literal}",
    meanMenuContainer: '{/literal}{$config.Reboot.reboot_resp_menu_attach}{literal}',
  });
  {/literal}{/if}{literal}

  $('.mobile-menu').on('click', 'a', function() {
    var expand_button = $(this).siblings('.mean-expand');
    if (expand_button.length > 0){
      expand_button.trigger('click');
      return false;
    }
  });

  $('.mobile-menu').on('click', '.mean-bar', function(e) {
    var pos = $(this).offset();
    var h = $(this).outerHeight();
    if (!$(e.target).hasClass('meanmenu-reveal') && e.pageY <= pos.top + h) {
      $(this).find('.meanmenu-reveal').trigger('click');
      return false;
    }
  });

});
</script>
{/literal}

