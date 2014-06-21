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
    # To dump all databases, set `db.name = :all` (or leave blank)
    db.name               = '{{ mysql_db_name }}'
    db.username           = '{{ mysql_user_name }}'
    db.password           = '{{ mysql_user_password }}'
    db.host               = 'localhost'
    db.port               = 3306
    db.socket             = '/var/lib/mysql/mysql.sock'
    # db.skip_tables        = ["skip", "these", "tables"]
    # db.only_tables        = ["only", "these", "tables"]
    db.additional_options = ["--quick", "--single-transaction"]
  end

  ##
  # Amazon Simple Storage Service [Storage]
  #
  store_with S3 do |s3|
    # AWS Credentials
    # Or, to use a IAM Profile:
    # s3.use_iam_profile = true
    s3.access_key_id     = '{{ backup_s3_access_key_id }}'
    s3.secret_access_key = '{{ backup_s3_secret_access_key }}'
    s3.region            = '{{ backup_s3_bucket_region }}'
    s3.bucket            = '{{ backup_s3_bucket_name }}'
    s3.path              = '{{ backup_s3_bucket_path }}'
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
  notify_by Mail do |mail|
    mail.on_success           = true
    mail.on_warning           = true
    mail.on_failure           = true

    mail.from                 = '{{ email_address }}'
    mail.to                   = '{{ backup_notifier_email_to }}'
    mail.address              = '{{ email_server }}'
    mail.port                 = 587
    mail.domain               = '{{ email_domain }}'
    mail.user_name            = '{{ email_username }}'
    mail.password             = '{{ email_password }}'
    mail.authentication       = 'plain'
    mail.encryption           = :starttls
  end

end
