<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-4">
                <div class="footer__logos">

                    {% for item in module.logo %}

                    {% set href = item.logo_url.url.href %}
                    {% if item.logo_url.url.type is equalto "EMAIL_ADDRESS" %}
                    {% set href = "mailto:" + href %}
                    {% endif %}
                    <a href="{{ href }}" class="footer-logo"
                       {% if item.logo_url.open_in_new_tab %}target="_blank"{% endif %}
                       {% if item.logo_url.no_follow %}rel="nofollow"{% endif %}
                    >

                        {% if item.logo_image.src %}
                        <img src="{{ item.logo_image.src }}" alt="{{ item.logo_image.alt }}"
                             width="{{ item.logo_image.width }}"
                             height="{{ item.logo_image.height }}">
                        {% endif %}

                    </a>
                    <div class="footer-logo-divider"></div>
                    {% endfor %}
                </div>
            </div>

            <div class="col-12 col-sm-4">
                <article class="footer__socials">
                    <!-- Twitter -->
                    {% if module.socials.twitter_link.url.href %}

                    {% set href = module.socials.twitter_link.url.href %}
                    {% if module.socials.twitter_link.url.type is equalto "EMAIL_ADDRESS" %}
                    {% set href = "mailto:" + href %}
                    {% endif %}
                    <a href="{{ href }}"
                       {% if module.socials.twitter_link.open_in_new_tab %}target="_blank"{% endif %}
                       {% if module.socials.twitter_link.no_follow %}rel="nofollow"{% endif %}
                    >
                        <i class="icon-twitter"></i>
                    </a>

                    {% endif %}

                    <!-- Facebook -->
                    {% if module.socials.facebook_link.url.href %}

                    {% set href = module.socials.facebook_link.url.href %}
                    {% if module.socials.facebook_link.url.type is equalto "EMAIL_ADDRESS" %}
                    {% set href = "mailto:" + href %}
                    {% endif %}
                    <a href="{{ href }}"
                       {% if module.socials.facebook_link.open_in_new_tab %}target="_blank"{% endif %}
                       {% if module.socials.facebook_link.no_follow %}rel="nofollow"{% endif %}
                    >
                        <i class="icon-facebook"></i>
                    </a>

                    {% endif %}

                    <!-- Linkedin -->
                    {% if module.socials.linkedin_link.url.href %}

                    {% set href = module.socials.linkedin_link.url.href %}
                    {% if module.socials.linkedin_link.url.type is equalto "EMAIL_ADDRESS" %}
                    {% set href = "mailto:" + href %}
                    {% endif %}
                    <a href="{{ href }}"
                       {% if module.socials.linkedin_link.open_in_new_tab %}target="_blank"{% endif %}
                       {% if module.socials.linkedin_link.no_follow %}rel="nofollow"{% endif %}
                    >
                        <i class="icon-linkedin"></i>
                    </a>

                    {% endif %}

                    <!-- You Tube -->
                    {% if module.socials.youtube_link.url.href %}

                    {% set href = module.socials.youtube_link.url.href %}
                    {% if module.socials.youtube_link.url.type is equalto "EMAIL_ADDRESS" %}
                    {% set href = "mailto:" + href %}
                    {% endif %}
                    <a href="{{ href }}"
                       {% if module.socials.youtube_link.open_in_new_tab %}target="_blank"{% endif %}
                       {% if module.socials.youtube_link.no_follow %}rel="nofollow"{% endif %}
                    >
                        <i class="icon-youtube-play"></i>
                    </a>

                    {% endif %}
                </article>
            </div>

            <div class="col-12 col-sm-4">
                <h4 class="footer__copyright">{{ module.copyright_text }}</h4>
            </div>
        </div>
    </div>
</footer>