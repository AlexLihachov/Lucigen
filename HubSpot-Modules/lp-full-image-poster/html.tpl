<section class="full-image-poster">
    <div class="full-image-poster__wrapper">
        <article class="full-image-poster__content full-image-poster__content--{{ module.type_of_content }}">

            {% if module.type_of_content == 'quote' %}


            {% if module.quote.quote_text %}
            <h3 class="full-image-poster__title">
                {% inline_rich_text field="quote.quote_text" value="{{ module.quote.quote_text }}" %}
            </h3>
            {% endif %}

            {% if module.quote.author %}
            <h4 class="full-image-poster__subtitle">
                {% inline_rich_text field="quote.author" value="{{ module.quote.author }}" %}
            </h4>
            {% endif %}

            {% else %}

            {% if module.posters.title %}
            <h3 class="full-image-poster__title">{{ module.posters.title }}</h3>
            {% endif %}

            {% if module.posters.title %}
            <h4 class="full-image-poster__subtitle">{{ module.posters.subtitle }}</h4>
            {% endif %}


            {% for item in module.posters.poster %}
            <div class="poster-card">
                {% if item.poster_number %}
                <h5 class="poster-card__title">{{ item.poster_number }}</h5>
                {% endif %}
                {% if item.description %}
                <p class="poster-card__text">{{ item.description }}</p>
                {% endif %}

                {% set href = item.cta.url.href %}
                {% if item.cta.url.type is equalto "EMAIL_ADDRESS" %}
                {% set href = "mailto:" + href %}
                {% endif %}

                {% if href %}
                <a class="poster-card__link" href="{{ href }}"
                   {% if item.cta.open_in_new_tab %}target="_blank"{% endif %}
                   {% if item.cta.no_follow %}rel="nofollow"{% endif %}
                >
                    {% if item.cta_text %}
                    {{ item.cta_text }}
                    {% else %}
                    {{ "View Poster" }}
                    {% endif %}
                </a>
                {% endif %}
            </div>
            {% endfor %}


            {% endif %}

        </article>
        <div class="full-image-poster__image">
            {% if module.image.src %}
            <img src="{{ module.image.src }}" alt="{{ module.image.alt }}" width="{{ module.image.width }}" height="{{ module.image.height }}">
            {% endif %}
        </div>
    </div>
</section>
