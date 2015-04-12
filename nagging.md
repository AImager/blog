---
layout: page
---

岁月很厉害的，有些东西不记下来，以后就忘了......

<ul class="nagging">
{% for item in site.nagging reversed %}
  {% assign current = item.title | split:'-' | first %}
  {% if forloop.first or current != indexvar %}<h2 id="year" >
    {{ item.title | split:'-' | first }}
  </h2>{% endif %}
  {% assign indexvar = item.title | split:'-' | first %}
  <span><a href={{ item.url }}>{{ item.title | split:'-' | last }}</a>&nbsp;&nbsp;&nbsp;</span>
{% endfor %}
</ul>
