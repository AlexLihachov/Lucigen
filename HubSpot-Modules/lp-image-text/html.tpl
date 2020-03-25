{% set mediaColumnsClasses="image-text__media" %}
{% if module.use_lightgallery %}
{% set mediaColumnsClasses="image-text__media js-hook__lg" %}
{% endif %}


<section class="image-text">
	<div class="container">
		<div class="row">
			<div class="col-12 col-sm-6">
				<div class="{{ mediaColumnsClasses }}" >
					{% if module.use_lightgallery %}
					<a href="{{ module.image_text_image.src }}">
					{% endif %}

						{% if module.image_text_image.src %}
						{% set sizeAttrs = 'width="{{ module.image_text_image.width }}" height="{{ module.image_text_image.height }}"' %}
						{% if module.image_text_image.size_type == 'auto' %}
						{% set sizeAttrs = 'style="max-width: 100%; height: auto;"' %}
						{% elif module.image_text_image.size_type == 'auto_custom_max' %}
						{% set sizeAttrs = 'width="100%" height="auto" style="max-width: {{ module.image_text_image.max_width }}px; max-height: {{ module.image_text_image.max_height }}px"' %}
						{% endif %}
						<img class="" src="{{ module.image_text_image.src }}" alt="{{ module.image_text_image.alt }}" {{ sizeAttrs }}>
						{% endif %}

					{% if module.use_lightgallery %}
					</a>
					{% endif %}
				</div>
			</div>
			<div class="col-12 col-sm-6">
				<article class="image-text__content">
					{% inline_rich_text field="image_text_content" value="{{ module.image_text_content }}" %}
				</article>
				{% if module.cta_link.url.href %}
				<div class="c-button--green image-text__cta">
					{% set href = module.cta_link.url.href %}
					{% if module.cta_link.url.type is equalto "EMAIL_ADDRESS" %}
					{% set href = "mailto:" + href %}
					{% endif %}
					<a href="{{ href }}"
					   {% if module.cta_link.open_in_new_tab %}target="_blank"{% endif %}
					   {% if module.cta_link.no_follow %}rel="nofollow"{% endif %}
					>
						{{ module.cta_link_text }}
					</a>
				</div>
				{% endif %}
			</div>
		</div>
	</div>
</section>