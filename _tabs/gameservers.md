---
layout: page
icon: fas fa-gamepad
order: 4
---

<table>
 <tbody>
<!-- begin first-level logic -->
{% for game in site.data.gameservers %}

  <!-- Begin first-level content -->
  <h1>{{ game.game_title }}</h1>
  <!--   End first-level content -->

  <!-- Begin second level logic -->
  {% assign level2 = game.child %}
  {% if level2 %}
    {% for child in level2 %}

      <!-- Begin second-level content -->
    <h2>{{ child.title }}</h2>
    <h3>{{ child.server_name }}</h3>
    <p>
      - Address: {{ child.address }}<br/>
      - Port: {{ child.port }}<br/>
      - Availability: {{ child.availability }}<br/>
      {% if child.workshop_url %}
      - Required Content: <a href="{{ child.workshop_url }}">{{ child.workshop_url }}</a><br/>
      {% endif %}
    </p>
      <!--   End second-level content -->


    {% endfor %}
  {% endif %}
  <!-- End second-level logic -->

{% endfor %}
<!-- End first-level logic -->
 </tbody>
</table>
