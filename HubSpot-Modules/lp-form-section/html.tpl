<section class="form-section">
    <div class="container">
        <div class="row">
            <div class="col-12">

                {% if module.max_width|string == 'null' %}
                {% set max_width = '100%' %}
                {% elif module.max_width|abs == 0 %}
                {% set max_width = '100%' %}
                {% else %}
                {% set max_width = module.max_width|abs + 'px' %}
                {% endif %}

                <div id="{{ module.form_id }}" class="form-section__wrapper" style="max-width: {{ max_width }}">
                    {% if module.form_content %}
                    {% inline_rich_text field="form_content" value="{{ module.form_content }}" %}
                    {% endif %}
                </div>
            </div>
        </div>
    </div>
</section>