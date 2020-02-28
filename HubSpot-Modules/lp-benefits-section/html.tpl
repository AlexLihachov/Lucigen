<section class="benefits benefits--{{ module.boxes_alignment }}">
    <div class="container">
        <div class="row benefits-row">

            <div class="col-12 col-sm-5">
                {% if module.title %}
                <h3 class="benefits__title">
                    {{ module.title }}
                </h3>
                {% endif %}

                {% if module.list_item %}
                <ul class="benefits-list">
                    {% for item in module.list_item %}
                    <li class="benefits-list__item">{{ item }}</li>
                    {% endfor %}
                </ul>
                {% elif module.form_content %}
                <div class="benefits-form">
                    {% inline_rich_text field="form_content" value="{{ module.form_content }}" %}
                </div>
                {% endif %}


            </div>

            <div class="col-12 col-sm-1"></div>

            <div class="col-12 col-sm-6">
                <div class="row">
                    {% for item in module.box %}
                    <div class="col-12 col-sm-6 col-md-4">
                        <div class="benefit-card">
                            <div class="benefit-card__content">
                                {% set href = item.box_link.url.href %}
                                {% if item.box_link.url.type is equalto "EMAIL_ADDRESS" %}
                                {% set href = "mailto:" + href %}
                                {% endif %}

                                {% if href %}
                                <a href="{{ href }}"
                                   {% if item.box_link.open_in_new_tab %}target="_blank"{% endif %}
                                   {% if item.box_link.no_follow %}rel="nofollow"{% endif %}
                                >
                                    {% endif %}

                                    {% if item.box_title %}
                                    <h3 class="benefit-card__title">{{ item.box_title }}</h3>
                                    {% endif %}

                                    {% if item.box_text %}
                                    <p class="benefit-card__text">{{ item.box_text }}</p>
                                    {% endif %}

                                    {% if href %}
                                </a>
                                {% endif %}
                            </div>
                        </div>
                    </div>
                    {% endfor %}
                </div>
            </div>
        </div>
    </div>
</section>