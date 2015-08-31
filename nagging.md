---
layout: page
---

<meta http-equiv=refresh content="0;url=/nagging/{{site.nagging.last.title | split:'-' | first }}.html">

<!--岁月很厉害，有些东西不记下来，以后就忘了......-->

<!--<ul class="nagging">
{% for item in site.nagging reversed %}
  {% assign current = item.title | split:'-' | first %}
  {% if forloop.first or current != indexvar %}<h2 id="year" >
    {{ item.title | split:'-' | first }}
  </h2>{% endif %}
  {% assign indexvar = item.title | split:'-' | first %}
  <span><a href={{ item.url }}>{{ item.title | split:'-' | last }}</a>&nbsp;&nbsp;&nbsp;</span>
{% endfor %}




 <div class="divider">
    <span>
    {% if page.previous  %}
    <a href="{{ page.previous.url }}"><i class="fa fa-chevron-left"></i></a>
    {% else %}
    <i class="fa fa-circle"></i>
    {% endif %}
    </span>

    <span>
    {% if page.next %}
    <a href="{{ page.next.url }}"><i class="fa fa-chevron-right"></i></a>
    {% else %}
    <i class="fa fa-circle"></i>
    {% endif %}
    </span>
  </div>

</ul>

-->


