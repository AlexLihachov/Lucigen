<!DOCTYPE html>
<html>
    <head>
        <base href="https://www2.lgcgroup.com">
        <meta charset="utf-8"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style>
            html {
                background: #f2f1f1;
                font-size: 6px;
            }

            @media screen and (min-width: 370px) {
                html {
                    font-size: 8px;
                }
            }

            @media screen and (min-width: 450px) {
                html {
                    font-size: 10px;
                }
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* --------------------------------------------- */
            #pardot-form {
                margin: 0;
                padding: 5.9rem 4.5rem 0 4.8rem;
                color: #000;
                font-family: Arial, sans-serif;
            }

            .form__title {
                margin: 0 0 3.2rem;
                font-size: 3rem;
                font-weight: bold;
                line-height: 1.2;
                text-align: center;
            }

            /* --------------------------------------------- */

            .field-label {
                display: block;
                margin: 0 0 1.5rem;
                font-size: 1.6rem;
                font-weight: 700;
                line-height: 1.5;
            }

            input[type="text"], select {
                display: block;
                width: 100%;
                padding: 0.5rem 1.3rem;
                background: #fff;
                border: 1px solid #d2d0d0;
                border-radius: 4px;
                font-size: 1.5rem;
                font-weight: 400;
                line-height: 1.6;
                outline: none;
            }

            select {
                -webkit-appearance: none;
                position: relative;
                box-shadow: none;
                cursor: pointer;
            }

            /* --------------------------------------------- */

            .pd-text, .pd-select {
                position: relative;
                margin: 0 0 3rem;
            }

            .pd-text .field-label {
                position: absolute;
                top: 50%;
                left: 1.3rem;
                transform: translateY(-50%);
                font-size: 1.5rem;
                line-height: 1.6;
            }

            .pd-text.required .field-label::after {
                content: '*';
                position: absolute;
                top: 2px;
                color: #fb0101;
            }

            /* --------------------------------------------- */

            .pd-checkbox .value > span, .pd-radio .value > span {
                display: flex;
                align-items: center;
                justify-content: flex-start;
                width: 100%;
                margin: 0 0 1.6rem;
            }

            .pd-checkbox label.inline, .pd-radio label.inline {
                font-size: 1.4rem;
                max-width: 320px;
            }

            .checkbox-trigger {
                min-width: 1.9rem;
                width: 1.9rem;
                height: 1.9rem;
                margin: 0 1.1rem 0 0;
                border: 1px solid #d2d0d0;
                border-radius: 4px;
                background: #fff;
                cursor: pointer;
            }

            .checkbox-trigger.active {
                background: #d2d0d0;
            }

            /**/
            .Opt_In.pd-checkbox {
                margin: 0 0 4rem;
            }

            .Other.pd-radio {
                margin: 0 0 4rem;
            }

            /**/
            .Other.pd-radio .value > span {
                align-items: flex-start;
                margin-bottom: 2.4rem;
            }

            .Other.pd-radio .field-label {
                margin-bottom: 2.4rem;
                max-width: 300px;
                line-height: 1.6;
            }

            /* --------------------------------------------- */

            .Other_.pd-textarea {
                margin: 0 0 3.5rem;
            }

            textarea {
                display: block;
                width: 100%;
                min-height: 13.7rem;
                padding: 1.5rem 1.8rem;
                border-radius: 3px;
                border: 1px solid #d2d0d0;
                resize: none;
                outline: none;
                font-size: 1.4rem;
            }

            /* --------------------------------------------- */

            input[type="submit"] {
                -webkit-appearance: none;
                display: block;
                width: auto;
                margin: 0 auto;
                padding: 1.7rem 3.2rem;
                border: none;
                font-size: 1.8rem;
                font-weight: 700;
                color: #fff;
                border-radius: 25px;
                text-align: center;
                outline: none;
                background: #00788A;
                transition: all .2s ease-in;
                cursor: pointer;
            }

            input[type="submit"]:hover, input[type="submit"]:focus {
                background: #4A9CA7;
            }

            /* --------------------------------------------- */

            p.errors {
                color: #ca0813;
                font-size: 1.5rem;
                font-weight: bold;
                margin-bottom: 1.6rem;
            }

            .no-label.error {
                margin: -2rem 0 3rem 0;
                color: #ca0813;
                font-size: 1.5rem;
            }

            /* --------------------------------------------- */

            .layout-col-2 {
                display: flex;
                align-items: flex-start;
                justify-content: space-between;
            }

            .layout-col-2 p:first-of-type {
                width: 48%;
            }

            .layout-col-2 p:last-of-type {
                width: 48.5%;
            }


            /* Select 2*/
            .select2.select2-container.select2-container--default {
                display: block;
                width: 100% !important;
            }

            .select2-container--default .select2-selection--single {
                outline: none;
                border: 1px solid #d2d0d0 !important;
                height: 3.6rem !important;
            }

            .select2-search__field {
                outline: none;
            }

            .select2-container .select2-selection--single .select2-selection__rendered {
                padding: 0 0 0 1.3rem !important;
                height: 100% !important;
                line-height: 3.6rem !important;

                font-size: 1.5rem !important;
                font-weight: 400 !important;
                color: #000 !important;
            }

            .select2-results__option {
                font-family: Arial;
                font-size: 1.5rem !important;
                font-weight: 400 !important;
                color: #000 !important;
            }

            .select2-selection__arrow {
                top: 50% !important;
                transform: translateY(-50%);
                right: 10px !important;
            }

        </style>
        <meta name="description" content="%%description%%"/>
        <title>%%title%%</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.0/normalize.min.css" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/css/select2.min.css" rel="stylesheet" />
    </head>
    <body>
        %%content%%

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js"></script>

        <script>
            jQuery(document).ready(function ($) {
                var $form = $('#pardot-form');

                // Insert Title to form
                $form.prepend('<h2 class="form__title">RSVP today!</h2>')

                // Fullname wrapper col-2
                var $fullNameFieldsBox = $('.first_name, .last_name');
                $fullNameFieldsBox.wrapAll('<div class="layout-col-2"></div>');

                /* --------------------------- */
                var $textFields = $('input[type="text"]');

                $textFields.focusin(function () {
                    $(this).prev('.field-label').hide();
                });

                $textFields.focusout(function () {
                    var val = $(this).val();
                    if (val === '') {
                        $(this).prev('.field-label').show();
                    }
                });

                /* --------------------------- */

                var $checkboxField = $('input[type="checkbox"]');
                $checkboxField.each(function () {
                    var self = $(this);
                    var childrenAmount = self.closest('span.value').find('> span').length;

                    $('<div class="checkbox-trigger"></div>').insertBefore(self);
                    var $trigger = self.prev('.checkbox-trigger');

                    $trigger.on('click', function () {
                        if (childrenAmount > 1) {
                            $(this).toggleClass('active');
                            $(this).next('input[type="checkbox"]').click();
                        }
                    });

                    self.hide();

                    if (self.attr('checked') === 'checked') {
                        $trigger.addClass('active');
                    }
                });

                var $radioField = $('input[type="radio"]');
                $radioField.each(function () {
                    var self = $(this);
                    var childrenAmount = self.closest('span.value').find('> span').length;

                    $('<div class="checkbox-trigger"></div>').insertBefore(self);
                    var $trigger = self.prev('.checkbox-trigger');

                    $trigger.on('click', function () {
                        if (childrenAmount > 1) {
                            if (!$(this).hasClass('active')) {
                                $(this).next('input[type="radio"]').click();
                                self.closest('span.value').find('.checkbox-trigger').removeClass('active');
                                $(this).addClass('active');
                            } else {
                                return false;
                            }

                        }
                    });

                    self.hide();

                    if (self.attr('checked') === 'checked') {
                        $trigger.addClass('active');
                    }
                });


                var $fullnameErrorsBoxes = $('.layout-col-2').nextAll('.error.no-label')
                    .slice(0, 2).wrapAll('<div class="layout-col-2"></div>');

                /* --------------------------- */

                var receiveInfoFieldBox = $('.form-field.Other.pd-checkbox');
                receiveInfoFieldBox.find('.field-label').html("Would you like to continue to receive<br/>relevant information regarding LGC's<br/>products and services?");
                receiveInfoFieldBox.find('.value span:first-of-type .inline').html("Yes, I am happy to be contacted about LGC<br/>products, services, and research");
                receiveInfoFieldBox.find('.value span:last-of-type .inline').html("No, I do not consent to the use of my details for<br/>marketing of LGC products, services, and research");

                /* --------------------------- */
                var textareaOtherField = $('.Other_.pd-textarea textarea');
                textareaOtherField.attr("placeholder", "Add your comments or questions here");
                textareaOtherField.removeAttr('rows');

                /* Select */
                $('select').select2();

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

                function sendIframeHeight(height) {
                    // parent.window.postMessage(''.concat(height), "http://sandbox.lucigen.com/sample-competent-cells.html");
                    parent.window.postMessage(''.concat(height), "*");
                }

                var $contentStartHeight = $('html').innerHeight();
                var $windowWidth = $(window).width();

                sendIframeHeight($contentStartHeight + 46);

                $(window).on('resizeEnd', function () {
                    var $currentWindowWidth = $(window).width();

                    if ($currentWindowWidth === $windowWidth) return;

                    $windowWidth = $currentWindowWidth;
                    $contentStartHeight = $('html').innerHeight();

                    sendIframeHeight($contentStartHeight + 46);
                });
            });
        </script>
    </body>
</html>
