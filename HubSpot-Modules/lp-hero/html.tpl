<section class="hero js-hook__hero"
         style="background-image: url({{ module.main_image.src }});"
         data-width="{{ module.main_image.width }}"
         data-height="{{ module.main_image.height }}">

    {% if module.subtitle %}
    <div class="hero__shape">
        <h2 class="hero__title">{{ module.title }}</h2>
    </div>
    {% endif %}

    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-6">
                <div class="hero__logo">
                    {% if module.logo.src %}
                    <img src="{{ module.logo.src }}" alt="{{ module.logo.alt }}" />
                    {% endif %}
                </div>
            </div>
            <div class="col-12 col-sm-6">
                <article class="hero__content">
                    {% if module.subtitle %}
                    <h2 class="hero__subtitle">{{ module.subtitle }}</h2>
                    {% endif %}

                    {% set href = module.cta.url.href %}
                    {% if module.cta.url.type is equalto "EMAIL_ADDRESS" %}
                    {% set href = "mailto:" + href %}
                    {% endif %}
                    <a class="hero__button" href="{{ href }}"
                       {% if module.cta.open_in_new_tab %}target="_blank"{% endif %}
                       {% if module.cta.no_follow %}rel="nofollow"{% endif %}
                    >
                        {{ module.cta_text }}
                    </a>
                </article>
            </div>
        </div>
    </div>
</section>

