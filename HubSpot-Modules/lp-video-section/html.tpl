<div class="videos-section">
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-6">
                <div class="video-preview">
                    <div class="video-preview__wrapper">
                        {% if module.form_iframe  %}
                        {{ module.form_iframe }}
                        {% endif %}
                    </div>
                </div>
            </div>

            <div class="col-12 col-sm-6">
                {% if module.content %}
                <article class="videos-section__content">
                    {% inline_rich_text field="content" value="{{ module.content }}" %}
                </article>
                {% endif %}
            </div>
        </div>
        <div class="row">
            <div class="video-grid">
                {% for item in module.field_group %}

                {% set href = item.link.url.href %}
                {% if item.link.url.type is equalto "EMAIL_ADDRESS" %}
                {% set href = "mailto:" + href %}
                {% endif %}
                <a href="{{ href }}" class="video-preview"
                   {% if item.link.open_in_new_tab %}target="_blank"{% endif %}
                   {% if item.link.no_follow %}rel="nofollow"{% endif %}
                >
                    <div class="video-preview__image">
                        {% if item.video_snapshot.src %}
                        <img src="{{ item.video_snapshot.src }}" alt="{{ item.video_snapshot.alt }}" width="{{ item.video_snapshot.width }}" height="{{ item.video_snapshot.height }}">
                        {% endif %}
                    </div>
                    {% if item.text_field %}
                    <h4 class="video-preview__title">{{ item.text_field }}</h4>
                    {% endif %}
                </a>

                {% endfor %}
            </div>
        </div>
    </div>
</div>