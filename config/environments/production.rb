Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Assets
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = false

  # ActiveStorage
  config.active_storage.service = :local

  # SSL
  config.force_ssl = true

  # Log
  config.log_level = :debug
  config.log_tags = [ :request_id ]
  config.log_formatter = ::Logger::Formatter.new

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # ActionMailer
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.default_url_options = { host: ENV['CANONICAL_HOST'] }

  config.action_mailer.smtp_settings = {
    user_name: ENV['MAILER_USERNAME'],
    password: ENV['MAILER_PASSWORD'],
    address: ENV['MAILER_ADDRESS'],
    domain: ENV['MAILER_DOMAIN'],
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
  }

  # I18n
  config.i18n.fallbacks = true

  # ActiveSupport
  config.active_support.deprecation = :notify

  # ActiveRecord
  config.active_record.dump_schema_after_migration = false
end
