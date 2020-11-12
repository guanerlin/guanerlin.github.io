---
layout: page
title: Coding
permalink: /coding/
---

<h3>all</h3>
<ul>  
	{% for post in site.posts %}
	 <li> 
    	<a href="{{ post.url }}">{{ post.title }}</a>&nbsp;&nbsp;&nbsp;{{ post.date | date: '%B %d, %Y'}}    
	 </li> 
	 {% endfor %} 
</ul>




{% for tag in site.tags %}  
<h3>{{ tag[0] }}</h3>  <ul>    
	{% for post in tag[1] %}      
		<li>
			<a href="{{ post.url }}">{{ post.title }}&nbsp;&nbsp;&nbsp;</a>{{ post.date | date: '%B %d, %Y'}}
		</li>    
	{% endfor %}  
</ul> 
{% endfor %}

