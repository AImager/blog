---
layout: wiki
title: wiki
---


<ul class="listing">

{% assign categories = site.wiki | group_by: "category" | sort: "name" %}


{% for category in categories %}
  <li class="listing-seperator" id="{{ category.name }}">{{ category.name }}</li>
{% for wiki in site.wiki %}
{% if wiki.category == category.name %}
  <li class="listing-item">
  <!--<time datetime="{{ wiki.category }}">{{ wiki.date | date:"%Y-%m-%d" }}</time>-->
  <a href="{{ wiki.url }}" title="{{ wiki.title }}">{{ wiki.title }}</a>
  <span class="wiki_tags">{% for tag in wiki.tags %}
  <span>{{ tag }}</span>
  {% endfor %}
  </span>
  
  </li>
  
  
  
{% endif %}
{% endfor %}
{% endfor %}
</ul>