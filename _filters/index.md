---
title: Filters Home
---

{% for filter in site.filters %}
  {% unless filter.title contains "Home" %}
    <h2 id="{{ filter.title }}">{{ filter.title }}</h2>
    <div class="">
      {{ filter.content }}
    </div>
  {% endunless %}
{% endfor %}
