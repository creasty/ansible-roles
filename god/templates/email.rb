# GmailのSMTPサーバでメール送信するためのモンキーパッチ
# https://coderwall.com/p/auiktq
Net::SMTP.class_eval do
  def initialize_with_starttls(*args)
    initialize_without_starttls(*args)
    enable_starttls
  end

  alias_method :initialize_without_starttls, :initialize
  alias_method :initialize, :initialize_with_starttls
end

God::Contacts::Email.defaults do |d|
  d.from_email      = '{{ email_address }}'
  d.from_name       = "Alert [#{PROJECT_NAME}]"
  d.server_host     = '{{ email_server }}'
  d.server_port     = 587
  d.server_auth     = :plain
  d.server_domain   = '{{ email_domain }}'
  d.server_user     = '{{ email_username }}'
  d.server_password = '{{ email_password }}'
end
