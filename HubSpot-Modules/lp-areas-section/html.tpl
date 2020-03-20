{% set sectionClass="areas-section" %}
{% if module.remove_padding_bottom %}
{% set sectionClass="areas-section areas-section--remove-bottom" %}
{% endif %}

{% set gridStyleClass="card-grid" %}
{% set groupsAmount=module.column_group|length %}
{% set groupsRows=groupsAmount/4 %}
{% set groupsRowsFullNumber=groupsRows|round(0, 'floor') %}
{% set amountRest=0 %}



{% if groupsAmount > 4 %}
{% set amountRest=groupsAmount - (groupsRowsFullNumber*4) %}


{% if amountRest == 1 and groupsRowsFullNumber > 1 %}
{% set gridStyleClass="card-grid card-grid--multiple card-grid--last-9" %}

{% elif amountRest == 1 and groupsRowsFullNumber == 1 %}
{% set gridStyleClass="card-grid card-grid--multiple card-grid--last-2" %}

{% elif amountRest == 2 %}
{% set gridStyleClass="card-grid card-grid--multiple card-grid--last-6" %}

{% elif amountRest == 3 %}
{% set gridStyleClass="card-grid card-grid--multiple card-grid--last-3" %}

{% endif %}

{% endif %}

<section class="{{ sectionClass }}">
    {% if module.section_title %}
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h3 class="areas-section__title">
                    {{ module.section_title }}
                </h3>
                {% if module.section_subtitle %}
                <p class="areas-section__subtitle">
                    {{ module.section_subtitle }}
                </p>
                {% endif %}
            </div>
        </div>
    </div>
    {% endif %}

    <div class="{{ gridStyleClass }}">
        <div class="card-row">
            {% for item in module.column_group %}

            <div class="card">
                {% if item.shape_image.src %}
                <div class="card__image js-hook__konva"
                     data-type="{{ item.type_of_shape }}"
                     data-src="{{ item.shape_image.src }}"
                     data-imgW="{{ item.shape_image.width }}"
                     data-imgH="{{ item.shape_image.height }}"
                     data-shapeColor="{{ item.shape_color }}"
                ></div>
                {% endif %}
                <div class="card__inner js-hook__mh-item-responsive">
                    {% if item.column_title %}
                    <h4 class="card__title">{{ item.column_title }}</h4>
                    {% endif %}

                    {% if item.column_text %}
                    <div class="card__text">
                        {% inline_rich_text field="column_text" value="{{ item.column_text }}" %}
                    </div>
                    {% endif %}

                    {% if item.column_cta.url.href %}
                    {% set href = item.column_cta.url.href %}
                    {% if item.column_cta.url.type is equalto "EMAIL_ADDRESS" %}
                    {% set href = "mailto:" + href %}
                    {% endif %}
                    <a class="card__link" href="{{ href }}"
                       {% if item.column_cta.open_in_new_tab %}target="_blank" {% endif %}
                       {% if item.column_cta.no_follow %}rel="nofollow" {% endif %}
                    >
                        {{ item.column_cta_text }}
                    </a>
                    {% endif %}

                    {% if item.popup_link_text %}
                    <a href="#" class="card__popup-trigger js-hook__abstract-popup-trigger">
                        {{ item.popup_link_text }}
                    </a>

                    <div class="abstract-popup js-hook__abstract-popup">
                        <div class="abstract-popup__wrapper">
                            <a href="#" class="abstract-popup__close-icon js-hook__close-abstract-popup">
                                <i class="icon-cancel"></i>
                            </a>

                            {% if item.popup_title %}
                            <h5 class="abstract-popup__subtitle">{{ item.popup_title }}</h5>
                            {% endif %}
                            {% if item.popup_content %}
                            <div class="abstract-popup__content">
                                {% inline_rich_text field="popup_content" value="{{ item.popup_content }}" %}
                            </div>
                            {% endif %}
                        </div>
                    </div>
                    {% endif %}
                </div>
            </div>

            {% endfor %}
        </div>
    </div>


</section>



