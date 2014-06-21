Net::SMTP.class_eval do
  def initialize_with_starttls(*args)
    initialize_without_starttls(*args)
    enable_starttls
  end

  alias_method :initialize_without_starttls, :initialize
  alias_method :initialize, :initialize_with_starttls
end

God::Contacts::Email.defaults do |d|
  d.from_email      = '{{ god.mailer.address }}'
  d.from_name       = "Alert: {{ god.project_name }}"
  d.server_host     = '{{ god.mailer.server }}'
  d.server_port     = '{{ god.mailer.port }}'
  d.server_auth     = :plain
  d.server_domain   = '{{ god.mailer.domain }}'
  d.server_user     = '{{ god.mailer.username }}'
  d.server_password = '{{ god.mailer.password }}'
end
