PROJECT_NAME     = '{{ god.project_name }}'
RAILS_ENV        = '{{ rails.env }}'
APPLICATION_ROOT = '{{ app.path }}'

ALERT_TO = [
{% for contact in god.contacts %}
  '{{ contact.name }}@{{ contact.via }}',
{% endfor %}
]

God.load '/etc/god/contacts/email.rb'

{% if god.twilio is defined %}
God.load '/etc/god/contacts/twilio.rb'
{% endif %}

{% for contact in god.contacts %}
God.contact(:{{ contact.via }}) do |c|
  c.name = '{{ contact.name }}@{{ contact.via }}'
  c.to_{{ contact.type }} = '{{ contact.to }}'
end
{% endfor %}

God.load '/etc/god/config/*.god'

