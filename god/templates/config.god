# メールで通知したいときに使用する設定
PROJECT_NAME          = '{{ god_project_name }}'
ALERT_EMAIL_FROM      = '{{ email_address }}'
ALERT_EMAIL_FROM_NAME = "Alert [#{PROJECT_NAME}]"
ALERT_EMAIL_PASSWORD  = '{{ email_password }}'
ALERT_EMAIL_SERVER    = '{{ email_server }}'
ALERT_EMAIL_DOAMIN    = '{{ email_domain }}'

# Twilioを使用して電話で通知したいときに使用する設定
{% if god_twilio_account is defined %}
TWILIO_ACCOUNT_SID = '{{ god_twilio_account }}'
TWILIO_AUTH_TOKEN  = '{{ god_twilio_token }}'
TWILIO_FROM_NUMBER = '{{ god_twilio_number }}'
TWILIO_MESSAGE_URL = '{{ god_twilio_message_url }}'
{% endif %}

# 通知先の設定。このファイルの下で設定している `God.contact` 内の `c.name` の値を配列で指定する
ALERT_TO = [
{% for contact in god_contacts %}
  '{{ contact.name }}@{{ contact.via }}',
{% endfor %}
]

# DelayedJobなど、Bundleコマンドから起動するプロセスを監視するときに使用する設定
RAILS_ENV        = '{{ rails_env }}'
APPLICATION_ROOT = '{{ app_path }}'

# メール通知を行うための設定ファイルを読み込む
God.load '/etc/god/contacts/email.rb'

# 電話通知を行うための設定ファイルを読み込む
{% if god_twilio_account is defined %}
God.load '/etc/god/contacts/twilio.rb'
{% endif %}

# 連絡先の設定
{% for contact in god_contacts %}
God.contact(:{{ contact.via }}) do |c|
  c.name = '{{ contact.name }}@{{ contact.via }}'
  c.to_{{ contact.type }} = '{{ contact.to }}'
end
{% endfor %}

# 各種プロセスを監視するための設定ファイルを読み込む
God.load '/etc/god/config/*.god'

