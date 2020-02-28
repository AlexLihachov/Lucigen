
{*99f49a017eeaa96cf5c4060c7785548523d6ad12, v4 (xcart_4_6_2), 2014-01-15 17:46:03, ga_code_async.tpl, mixon*}
{*vim: set ts=2 sw=2 sts=2 et:*}

<script type="text/javascript">
    (function(i,s,o,g,r,a,m){ldelim}i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){ldelim}
        (i[r].q=i[r].q||[]).push(arguments){rdelim},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        {rdelim})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', '{$config.Google_Analytics.ganalytics_code}');  // Property ID.
    ga('require', 'linkid', 'linkid.js');
    ga('send', 'pageview');

    {if $config.Google_Analytics.ganalytics_e_commerce_analysis eq "Y" and $ga_track_commerce eq "Y" and $main eq "order_message" and $orders}
    // Ecommerce Tracking for order_message page
    window.dataLayer = window.dataLayer || [];

    {foreach from=$orders item="order"}

    dataLayer.push({
        'event': 'transactionSuccess',
        'ecommerce': {
            'purchase': {
                'actionField': {
                    'id': '{$order.order.orderid}',                         // Transaction ID. Required for purchases and refunds.
                    'affiliation': 'Lucigen.com',
                    'revenue': '{$order.order.total}',                     // Total transaction value (incl. tax and shipping)
                    'tax': '{if $order.order.tax gt 0}{$order.order.tax}{/if}',
                    'shipping': '{if $order.order.shipping_cost gt 0}{$order.order.shipping_cost}{/if}',
                    'coupon': '{$order.coupon}'
                },

                // List of productFieldObjects.
                'products': [
                    {foreach from=$order.products item="product"}
                    {
                    'name': '{$product.product|wm_remove|escape:javascript}{if $active_modules.Product_Options ne "" and $product.product_options_txt} ({$product.product_options_txt|replace:"\\n":", "|wm_remove|escape:javascript}){/if}',     // Name or ID is required.
                    'id': '{$product.productid}',
                    'price': '{$product.price}',
                    'category': '{func_get_categories_list($product.categoryid, true, true)}',
                    'variant': '',
                    'quantity': {$product.amount},
                    'coupon': ''                            // Optional fields may be omitted or set to empty string.
                    },
                    {/foreach}
                   ]
            }
        }
    });
    {/foreach}
    {/if}
</script>

