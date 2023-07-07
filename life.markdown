---
layout: post
title: Life
permalink: /life/
---

<ul>
    {% for category in site.categories %}
    	{% if category[0] == "life" %}
			{% for post in category[1] %}
			 <li> 
		    	<a href="{{ post.url }}">{{ post.title }}</a>&nbsp;&nbsp;&nbsp;{{ post.date | date: '%b %d, %Y'}} &nbsp;&nbsp;&nbsp;
		    	<p>tag:
		    	{% for tag in post.tags %}
		    		&nbsp;&nbsp;&nbsp;{{ tag }}&nbsp;
		    	{% endfor %}
		    	</p>
			 </li> 
			 {% endfor %} 
		 {% endif %}
    {% endfor %}
</ul>
