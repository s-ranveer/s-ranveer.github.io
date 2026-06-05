---
layout: archive
title: "CV"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---
{% include base_path %}

<iframe src="{{ base_path }}/files/cv_current.pdf" width="100%" height="900px" style="border: none;"></iframe>

<p><a href="{{ base_path }}/files/cv_current.pdf">Download CV (PDF)</a></p>

Publications
======
<ul>{% for post in site.publications reversed %}
  {% include archive-single-cv.html %}
{% endfor %}</ul>

