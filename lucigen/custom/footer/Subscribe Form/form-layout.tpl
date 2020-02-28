<!DOCTYPE html>
<html>
    <head>
        <base href="https://www2.lgcgroup.com">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* --------------------------------------------- */
            #pardot-form {
                margin: 0 0 10px;
                padding: 0;
                color: #000;
                font-family: Arial, sans-serif;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: flex-start;
                width: 100%;
                max-width: 100%;
            }

            label {
                display: none;
            }

            input[name="pi_extra_field"] {
                display: none !important;
            }

            input[type="text"] {
                display: block;
                width: 60%;
                height: 40px;
                padding: 6px 12px;
                font-size: 14px;
                margin: 0;
                box-shadow: none;
                border: none;
                color: #a4a4a4;
                border-radius: 5px;
                border-top-right-radius: 0;
                border-bottom-right-radius: 0;
                line-height: 1.42857143;
                background-color: #fff;
                outline: none;
            }

            input[type="submit"] {
                display: block;
                width: 40%;
                height: 40px;
                padding: 0 10px;
                font-size: 14px;
                font-weight: bold;
                line-height: 1;
                text-shadow: none;
                border-radius: 5px;
                border-top-left-radius: 0;
                border-bottom-left-radius: 0;
                outline: none;
                transition: background-color 0.2s ease-in-out;
                margin: 0;
                border: none;
                background-color: #0c7b93;
                text-align: center;
                vertical-align: middle;
                cursor: pointer;
                white-space: nowrap;
                color: #fff;
            }

            input[type="submit"]:hover, input[type="submit"]:active {
                background-color: #0e95b2;
            }

            p.errors, p.error {
                display: none;
                font-family: Arial, sans-serif;
                padding: 5px;
                color: #fff;
                font-size: 16px;
                text-align: center;
                border-radius: 5px;
                background-color: #ca0813;
            }

            h2 {
                font-size: 20px;
                color: #fff;
                font-weight: 400;
                text-align: center;
            }

        </style>
        <meta charset="utf-8"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="description" content="%%description%%"/>
        <title>%%title%%</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.0/normalize.min.css" type="text/css"/>
    </head>
    <body>
        %%content%%

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
            jQuery(document).ready(function ($) {
                var $form = $('#pardot-form');

                var $inputField = $('input[type="text"]');
                $inputField.unwrap();
                $inputField.attr("placeholder", "Email Address");

                var $submitField = $('input[type="submit"');
                $submitField.unwrap();

                var $errorMsg = $('p.error');

                if ($errorMsg.length) {
                    $errorMsg.appendTo('body').show();
                }
            });
        </script>
    </body>
</html>
