<section class="grey-intro-section">
    <div class="container">
        <div class="row">

            {% if module.shape_background_image.src %}

            <div class="col-12 col-md-1"></div>
            <div class="col-12 col-sm-6 col-md-5 grey-intro-section__inner">
                {% if module.content %}
                <div class="grey-intro-section__content">
                    {% inline_rich_text field="content" value="{{ module.content }}" %}
                </div>
                {% endif %}

                {% if module.cta_link.url.href %}
                {% set href = module.cta_link.url.href %}
                {% if module.cta_link.url.type is equalto "EMAIL_ADDRESS" %}
                {% set href = "mailto:" + href %}
                {% endif %}
                <div class="grey-intro-section__cta c-button--green">
                    <a href="{{ href }}"
                       {% if module.cta_link.open_in_new_tab %}target="_blank"{% endif %}
                       {% if module.cta_link.no_follow %}rel="nofollow"{% endif %}
                    >
                        {{ module.cta_link_text }}
                    </a>
                </div>
                {% endif %}
            </div>
            <div class="col-12 col-sm-6 col-md-6 grey-intro-section__image-column">
                <div class="grey-intro-section__image js-hook__konva"
                     data-type="12"
                     data-src="{{ module.shape_background_image.src }}"
                     data-imgW="{{ module.shape_background_image.width }}"
                     data-imgH="{{ module.shape_background_image.height }}"
                     data-shapeColor="cerulean-dark"
                ></div>
            </div>

            {% elif module.content %}

            <div class="col-12 grey-intro-section__inner">
                <div class="grey-intro-section__content grey-intro-section__content--center">
                    {% inline_rich_text field="content" value="{{ module.content }}" %}
                </div>

                {% if module.cta_link.url.href %}
                {% set href = module.cta_link.url.href %}
                {% if module.cta_link.url.type is equalto "EMAIL_ADDRESS" %}
                {% set href = "mailto:" + href %}
                {% endif %}
                <div class="grey-intro-section__cta grey-intro-section__cta--center c-button--green">
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