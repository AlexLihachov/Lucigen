<section class="hero-banner hero-banner--{{ module.content_align }}">
    <div class="container">
        <div class="row">
            {% if module.shape_background_image.src %}
            <!-- Shape with image variant -->
            <div class="col-12 col-sm-5">
                <div class="hero-banner__image js-hook__konva"
                     data-type="{{ module.type_of_shape }}"
                     data-src="{{ module.shape_background_image.src }}"
                     data-imgW="{{ module.shape_background_image.width }}"
                     data-imgH="{{ module.shape_background_image.height }}"
                     data-shapeColor="{{ module.shape_color }}"
                ></div>
            </div>
            <div class="col-12 col-sm-7">
                {% if module.content %}
                <article class="hero-banner__content">
                    {% inline_rich_text field="content" value="{{ module.content }}" %}
                </article>
                {% endif %}
            </div>

            {% elif module.quote %}
            <!-- Quote variant -->

            <div class="col-12 col-sm-6">
                <div class="hero-banner__quote-wrapper">
                    <div class="hero-banner__image js-hook__konva js-hook__konva-single"
                         data-type="{{ module.quote_shape_type }}"
                         data-shapeColor="{{ module.quote_shape_color }}"></div>

                    <article class="hero-banner__quote">
                        {% inline_rich_text field="quote" value="{{ module.quote }}" %}
                    </article>
                </div>
            </div>

            <div class="col-12 col-sm-6">
                {% if module.content %}
                <article class="hero-banner__content">
                    {% inline_rich_text field="content" value="{{ module.content }}" %}
                </article>
                {% endif %}
            </div>

            {% else %}
            <!-- Last variant -->
            <div class="col-12 col-lg-1"></div>

            <div class="col-12 col-lg-10">
                {% if module.content %}
                <article class="hero-banner__content">
                    {% inline_rich_text field="content" value="{{ module.content }}" %}
                </article>
                {% endif %}
            </div>

            <div class="col-12 col-lg-1"></div>
            {% endif %}
        </div>
    </div>
</section>