---
layout: page
title: Projects
icon: fa-solid fa-folder-open
order: 3
---

Everything on this page can be found on [my GitHub account](https://github.com/Jekotia), but here are some highlights.

---

## Docker Images
{% for entry in site.data.projects['docker'] %}
### {{ entry.title }} <a href="https://ghcr.io/{{ entry.image_name }}"><i class="fa-solid fa-cube"></i></a> <a href="https://github.com/{{ entry.source }}"><i class="fa-solid fa-code"></i></a>
[![tag](https://img.shields.io/github/v/tag/{{ entry.source }})](https://github.com/{{ entry.source }}/tags)[![Build & Push](https://github.com/{{ entry.source }}/actions/workflows/build-push.yml/badge.svg)](https://github.com/{{ entry.source }}/actions/workflows/build-push.yml)

{{ entry.description }}
{% endfor %}


## Repositories
{% for entry in site.data.projects['repositories'] %}
### {{ entry.title }} <a href="https://github.com/{{ entry.source }}"><i class="fa-solid fa-code"></i></a>
{% if entry.track_tags %}
[![tag](https://img.shields.io/github/v/tag/{{ entry.source }})](https://github.com/{{ entry.source }}/tags)
{% endif %}

{{ entry.description }}
{% endfor %}

---
{% comment %}
# Repositories
{% for entry in site.data.docker %}
# Docker Images
[{{ entry.title }}](https://ghcr.io/{{ entry.image_name }}) [![tag](https://img.shields.io/github/v/tag/{{ entry.source }})](https://github.com/{{ entry.source }}/tags) [![Build & Push](https://github.com/{{ entry.source }}/actions/workflows/build-push.yml/badge.svg)](https://github.com/{{ entry.source }}/actions/workflows/build-push.yml)
{% endfor %}
{% include docker_1.html %}

---

{% include docker_2.html %}

---

{% include docker_3.html %}

---

{% include docker_1.md %}

---

{% include docker_2.md %}

---

{% include docker_3.md %}
{% endcomment %}