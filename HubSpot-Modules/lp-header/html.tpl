<header class="c-header">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="c-header__wrapper">
                    <div class="c-header__logos">
                        {% for item in module.logos %}
                        {% set href = item.header_logo_link.url.href %}
                        {% if item.header_logo_link.url.type is equalto "EMAIL_ADDRESS" %}
                        {% set href = "mailto:" + href %}
                        {% endif %}
                        <a href="{{ href }}"
                           {% if item.header_logo_link.open_in_new_tab %}target="_blank"{% endif %}
                           {% if item.header_logo_link.no_follow %}rel="nofollow"{% endif %}
                        >
                            {% if item.logo.src %}
                            <img src="{{ item.logo.src }}" alt="{{ item.logo.alt }}" width="{{ item.logo.width }}" height="{{ item.logo.height }}">
                            {% endif %}
                        </a>
                        <div class="c-header-logo-divider"></div>
                        {% endfor %}
                    </div>

                    <div class="c-header__iso">
                        {% if module.iso.iso_image.src %}
                        <img src="{{ module.iso.iso_image.src }}" alt="{{ module.iso.iso_image.alt }}" width="{{ module.iso.iso_image.width }}" height="{{ module.iso.iso_image.height }}">
                        {% endif %}

                        {% if module.iso.iso_text %}
                        <span class="c-header__iso-text">
							{{ module.iso.iso_text }}
						</span>
                        {% endif %}
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

