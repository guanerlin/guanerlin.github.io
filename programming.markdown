---
layout: post
title: Programming
permalink: /programming/
---


<ul>
    {% for category in site.categories %}
    	{% if category[0] == "programming" %}
			{% for post in category[1] %}
			 <li>
		    	<a href="{{ post.url }}">{{ post.title }}</a>&nbsp;&nbsp;&nbsp;{{ post.date | date: '%B %d, %Y'}} &nbsp;&nbsp;&nbsp;
		    	<p>tag:
		    	{% for tag in post.tags %}
		    		&nbsp;{{ tag }}&nbsp;
		    	{% endfor %}
		    	</p>
			 </li>
			 {% endfor %}
		 {% endif %}
    {% endfor %}
</ul>
