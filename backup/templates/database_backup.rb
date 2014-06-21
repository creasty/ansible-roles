##
# Backup Generated: database_backup
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t database_backup [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://meskyanichi.github.io/backup
#
Model.new(:database_backup, 'Database backup') do

  ##
  # MySQL [Database]
  #
  database MySQL do |db|
    db.name               = '{{ backup.db.database }}'
    db.username           = '{{ backup.db.user }}'
    db.password           = '{{ backup.db.password }}'
    db.host               = '{{ backup.db.host }}'
    db.port               = '{{ backup.db.port }}'
{% if backup.db.socket is defined -%}
    db.socket             = '/var/lib/mysql/mysql.sock'
{% endif -%}
    # db.skip_tables        = ["skip", "these", "tables"]
    # db.only_tables        = ["only", "these", "tables"]
    db.additional_options = ['--quick', '--single-transaction']
  end

  ##
  # Amazon Simple Storage Service [Storage]
  #
  store_with S3 do |s3|
    # s3.use_iam_profile = true
    s3.access_key_id     = '{{ backup.s3.access_key_id }}'
    s3.secret_access_key = '{{ backup.s3.secret_access_key }}'
    s3.region            = '{{ backup.s3.region }}'
    s3.bucket            = '{{ backup.s3.name }}'
    s3.path              = '{{ backup.s3.path }}'
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

  ##
  # Mail [Notifier]
  #
  # The default delivery method for Mail Notifiers is 'SMTP'.
  # See the documentation for other delivery options.
  #
{% if backup.notification_mail is defined -%}
  notify_by Mail do |mail|
    mail.on_success     = true
    mail.on_warning     = true
    mail.on_failure     = true

    mail.from           = '{{ backup.notification_mail.address }}'
    mail.to             = '{{ backup.notification_mail.to }}'
    mail.address        = '{{ backup.notification_mail.server }}'
    mail.port           = '{{ backup.notification_mail.port }}'
    mail.domain         = '{{ backup.notification_mail.domain }}'
    mail.user_name      = '{{ backup.notification_mail.username }}'
    mail.password       = '{{ backup.notification_mail.password }}'
    mail.authentication = 'plain'
    mail.encryption     = :starttls
  end
{% endif -%}

end
