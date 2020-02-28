<section class="white-intro-section white-intro-section--{{ module.image_align }}"
        {% if module.section_background_color.color %}
        style="background-color: {{ module.section_background_color.color }};"
        {% endif %} >
    <div class="container">
        <div class="row">
            {% if module.shape_background_image.src %}
            <div class="col-12 col-sm-5">
                <div class="white-intro-section__image js-hook__konva"
                     data-type="{{ module.type_of_shape }}"
                     data-src="{{ module.shape_background_image.src }}"
                     data-imgW="{{ module.shape_background_image.width }}"
                     data-imgH="{{ module.shape_background_image.height }}"
                     data-shapeColor="{{ module.shape_color }}"
                ></div>
            </div>
            <div class="col-12 col-sm-7">
                {% if module.content %}
                <div class="white-intro-section__content">
                    {% inline_rich_text field="content" value="{{ module.content }}" %}
                </div>
                {% endif %}

                {% if module.cta_link.url.href %}
                {% set href = module.cta_link.url.href %}
                {% if module.cta_link.url.type is equalto "EMAIL_ADDRESS" %}
                {% set href = "mailto:" + href %}
                {% endif %}
                <div class="c-button--green white-intro-section__cta">
                    <a href="{{ href }}"
                       {% if module.cta_link.open_in_new_tab %}target="_blank"{% endif %}
                       {% if module.cta_link.no_follow %}rel="nofollow"{% endif %}
                    >
                        {{ module.cta_link_text }}
                    </a>
                </div>
                {% endif %}
            </div>
            {% else %}

            <div class="col-12">
                {% if module.content %}
                <div class="white-intro-section__content">
                    {% inline_rich_text field="content" value="{{ module.content }}" %}
                </div>
                {% endif %}

                {% if module.cta_link.url.href %}
                {% set href = module.cta_link.url.href %}
                {% if module.cta_link.url.type is equalto "EMAIL_ADDRESS" %}
                {% set href = "mailto:" + href %}
                {% endif %}
                <div class="c-button--green white-intro-section__cta">
                    <a href="{{ href }}"
                       {% if module.cta_link.open_in_new_tab %}target="_blank"{% endif %}
                       {% if module.cta_link.no_follow %}rel="nofollow"{% endif %}
                    >
                        {{ module.cta_link_text }}
                    </a>
                </div>
                {% endif %}
            </div>
            {% endif %}
        </div>
    </div>
</section>