---
layout: default
---

{% for item in site.photos %}
  <a href={{ item.url }}>{{ item.title }}</a>
{% endfor %}
