<section class="banner">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="banner__inner" style="background-image: url({{ module.background_image.src }});">
                    <article class="banner__content">
                        {% if module.title %}
                        <h3 class="banner__title">{% inline_rich_text field="title" value="{{ module.title }}" %}</h3>
                        {% endif %}

                        {% if module.subtitle %}
                        <h4 class="banner__subtitle">
                            {% inline_rich_text field="subtitle" value="{{ module.subtitle }}" %}

                            {% if module.popup_link_text %}
                            <a href="#" class="banner__popup-trigger js-hook__abstract-popup-trigger">{{ module.popup_link_text }}</a>
                            <div class="abstract-popup js-hook__abstract-popup">
                                <div class="abstract-popup__wrapper">
                                    <a href="#" class="abstract-popup__close-icon js-hook__close-abstract-popup">
                                        <i class="icon-cancel"></i>
                                    </a>

                                    {% if module.popup_title %}
                                    <h5 class="abstract-popup__subtitle">{{ module.popup_title }}</h5>
                                    {% endif %}
                                    {% if module.popup_content %}
                                    <div class="abstract-popup__content">
                                        {% inline_rich_text field="popup_content" value="{{ module.popup_content }}" %}
                                    </div>
                                    {% endif %}
                                </div>
                            </div>
                            {% endif %}
                        </h4>
                        {% endif %}

                        <img class="banner__sm-image" src="https://info.biosearchtech.com/hubfs/Image/PAG-lp-images/banner-orange-bg.png"
                             alt="Shape Image">
                    </article>
                </div>
            </div>
        </div>
    </div>
</section>