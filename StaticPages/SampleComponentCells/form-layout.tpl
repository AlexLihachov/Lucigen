<!DOCTYPE html>
<html>
    <head>
        <base href="" >
        <meta charset="utf-8"/>
        <meta name="description" content="%%description%%"/>
        <title>%%title%%</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.0/normalize.min.css" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900" rel="stylesheet">
        <style>
            * {
                box-sizing: border-box;
                font-family: "Roboto", sans-serif;
            }

            body {
                margin: 0 !important;
                height: 100%;
            }

            @media screen and (min-width: 768px) {
                body {
                    padding-right: 8px;
                }
            }

            html {
                overflow: hidden;
                height: 100%;
            }

            #pardot-form {
                padding: 0;
            }

            #pardot-form span.value {
                margin-left: 0;
            }

            #pardot-form input[type="text"],
            #pardot-form select, #pardot-form textarea {
                width: 100%;
                border-radius: 20px;
                background-color: #fdfdea;
                border-width: 1px;
                border-style: dotted;
                border-color: #dddada;
                padding: 0 3px;
                margin-left: 0;
                border: 1px solid #ccc;
                font-size: 1em;
                line-height: 1.071em;
                box-shadow: 0 1px 2px #eee inset;
            }

            #pardot-form p {
                width: 100%;
                max-width: 100%;
                margin-left: 0;
                margin-right: 0;
                padding-left: 0;
                padding-right: 0;
                margin-top: 0;
                /*margin-bottom: 16px;*/
                margin-bottom: 8px;
                color: #000;
            }

            #pardot-form p.errors {
                padding: 5px 10px;
                color: #fff;
                font-size: 14px;
            }

            #pardot-form p.first_name,
            #pardot-form p.last_name,
            #pardot-form p.city,
            #pardot-form p.state,
            #pardot-form p.country,
            #pardot-form p.zip {
                width: 50%;
            }

            #pardot-form p.first_name,
            #pardot-form p.city,
            #pardot-form p.country {
                padding-right: 2%;
            }

            #pardot-form p.last_name,
            #pardot-form p.state,
            #pardot-form p.zip {
                padding-left: 2%;
            }

            #pardot-form .field-label {
                width: auto;
                font-size: 13px;
                text-align: left;
                text-decoration: none;
                font-weight: bold;
            }

            #pardot-form .field-label--m {
                font-size: 13px;
            }

            #pardot-form .form__subtitle {
                font-size: 17px;
                color: #000;
                font-weight: bold;
                margin: 23px 0 13px 0;
            }

            #pardot-form .form__text {
                margin: 0 0 14px;
                font-size: 13px;
                color: #000;
                font-weight: 400;
            }

            #pardot-form .form__text--italic {
                font-style: italic;
            }

            #pardot-form .checkbox-field {
                display: flex;
                flex-direction: column;
                justify-content: flex-start;
                align-items: flex-start;
                margin: 0 0 10px;
            }

            #pardot-form .checkbox-field .field-label, #pardot-form .checkbox-field .value {
                width: 100%;
                display: block;
                padding: 0;
                margin-bottom: 5px;
            }

            #pardot-form .checkbox-field .value > span {
                display: flex;
                align-items: flex-start;
                justify-content: flex-start;
            }

            #pardot-form p label.inline {
                width: 100%;
                margin-right: 0;
            }

            #pardot-form .checkbox-field input {
                display: block;
                margin: 10px 10px 0 3px;
            }

            #pardot-form textarea {
                display: block;
                min-height: 70px;
                border-radius: 7px;
                resize: none;
                padding: 14px 17px;
            }

            #pardot-form textarea::placeholder {
                color: #000;
            }

            #pardot-form .c-link {
                color: #258b99;
                text-decoration: underline;
                transition: color .2s ease-in;
            }

            #pardot-form .c-link:hover {
                color: #1b6670;
            }

            /* CHANGE THE COLOR OF THE * TO RED */
            #pardot-form .required .field-label::after {
                content: '*';
                color: #ca0813;
                position: absolute;
                transform: translate(-100%, 0);
            }

            /* SUBMIT BUTTON */
            #pardot-form input[type="submit"] {
                display: block;
                width: 100%;
                margin: 0;
                font-family: "Roboto", sans-serif;
                font-size: 15px;
                font-weight: normal;
                cursor: pointer;
                color: #fff;
                background: #ca0813;
                padding: 14px;
                -webkit-appearance: none;
                transition: background-color .2s ease-in;
                border-radius: 7px;
            }

            #pardot-form input[type="submit"]:hover {
                background: #ef3e42;
            }

            .label-underneath {
                display: flex;
                flex-direction: column-reverse;
            }

            .flexbox {
                display: flex;
                width: 100%;
                justify-content: flex-start;
                align-items: flex-start;
            }

            .column {
                flex-direction: column;
            }

            .active {
                background-color: #ffffe0;
            }

        </style>
        <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
    </head>
    <body>
        %%content%%

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script>
            // create FULL NAME section:
            //wrap full-name div around first and last name
            var $fullName = $('.first_name, .last_name');
            $fullName.wrapAll('<div class="full-name"></div>');
            $fullName = $('.full-name'); //reassign $fullName to wrapper div
            // $fullName.prepend('<p class="form-field pd-text required required-custom"><label class="field-label">Full Name *</label</p>'); //match new full name label

            //move labels underneath inputs
            $fullName = $('.first_name, .last_name');

            $('.form-field').addClass('label-underneath');
            // $fullName.addClass('label-underneath');

            $('.form-field.email label, .form-field.company label').addClass('field-label--m');


            $fullName.wrapAll('<div class="flexbox"></div>');

            // create SEND SAMPLE TO section:
            var $address = $('.address_one, .address_two, .city, .country, .state');
            $address.wrapAll ('<div class="send-sample-to"></div>');
            $address = $('.send-sample-to');
            $('<p class="form__text form__text--italic">All samples are shipped via FedEx</p>').prependTo($address);
            $('<h3 class="form__subtitle">Send my sample to:</h3>').prependTo($address);
            // $address.prepend('<p class="form-field pd-text required required-custom"><label class="field-label">Send Sample To: *</label</p>');

            //move labels underneath inputs
            $address = $('.address_one, .address_two, .city, .country, .state, .zip');
            $address.addClass('label-underneath');
            $address.wrapAll('<div class="flexbox column"></div>');

            // CITY STATE
            var $cityState = $('.city, .state');
            $cityState.wrapAll('<div class="flexbox"></div>');

            // COUNTY ZIP
            var $countryZip = $('.country, .zip');
            $countryZip.wrapAll('<div class="flexbox"></div>');


            // Sample
            var $sampleBlock = $('.Genomics_Lucigen__Pick_Strain_2');
            $('<h3 class="form__subtitle">Strain Selection:</h3>').insertBefore($sampleBlock);

            // Other field
            var $otherField = $('.text-field--sm.Other textarea');
            $otherField.attr("placeholder", "Don't see your strain? Let us know which strain you'd like to sample here.");

            // ADD YELLOW BACKGROUND TO SECTIONS ON FOCUS STATE
            var $formFields = $("#pardot-form .form-field");
            $formFields.each(function(i) {
                if ($(this).parent().hasClass('flexbox')) {
                    $(this).parent().focusin(function() {
                        $(this).parent().addClass('active');
                    });
                    $(this).parent().focusout(function() {
                        $(this).parent().removeClass("active");
                    });
                } else {
                    $(this).focusin(function() {
                        $(this).addClass("active");
                    });
                    $(this).focusout(function() {
                        $(this).removeClass("active");
                    });
                }
            });


            // REMOVE EXTRA DIV APPEARING AT BOTTOM OF FORM
            var $submit = $('p.submit');
            $submit.next().remove();

            $('<p>*Available in US, Canada, and other select countries. Contact Lucigen <a href="mailto:custserv@lucigen.com?subject=Competent Cell Samples" class="c-link">customer service</a> for any questions.</p>').insertAfter($submit);


            // Bind Resize End Event to jQuery
            var timer = null;
            $(window).bind('resize.resizeEnd', function () {
                if (timer) {
                    clearInterval(timer);
                }
                timer = setInterval(function () {
                    clearInterval(timer);
                    $(window).trigger('resizeEnd');
                }, 250);
            });


            // Sending iFrame Height to parent window for preventing scrollable block
            var $form = jQuery('form#pardot-form');
            var $formStartHeight = $form.innerHeight();
            var $dependentFieldHeight = $('.form-field.Other ').height();
            var DEPENDENT_COUNTRY_VALUE = '2069346';
            var $windowWidth = $(window).width();

            function sendIframeHeight(height) {
                // parent.window.postMessage(''.concat(height), "http://sandbox.lucigen.com/sample-competent-cells.html");
                parent.window.postMessage(''.concat(height), "*");
            }

            $('.country select').on('change', function (e) {
                var computedHeight = $(this).val() === DEPENDENT_COUNTRY_VALUE ? $formStartHeight + 20 + $dependentFieldHeight : $formStartHeight + 20;
                sendIframeHeight(computedHeight);
            });

            $(window).on('load', function () {
                $formStartHeight = $form.innerHeight();
                sendIframeHeight($formStartHeight + 20);
            });

            $(window).on('resizeEnd', function () {
                var $currentWindowWidth = $(window).width();

                if ($currentWindowWidth === $windowWidth) return;

                $windowWidth = $currentWindowWidth;
                $dependentFieldHeight = $('.form-field.Other ').height();
                $formStartHeight = $form.innerHeight();

                if ($('.country select').val() === DEPENDENT_COUNTRY_VALUE) {
                    $formStartHeight = $formStartHeight - $dependentFieldHeight;
                    sendIframeHeight($formStartHeight + 20 + $dependentFieldHeight);
                } else {
                    sendIframeHeight($formStartHeight + 20);
                }
            });
        </script>
    </body>
</html>

