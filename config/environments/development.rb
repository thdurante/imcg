Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # ActiveStorage
  config.active_storage.service = :local

  # ActionMailer
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # ActiveSuport
  config.active_support.deprecation = :log
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # ActiveRecord
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true

  # Assets
  config.assets.debug = true
  config.assets.quiet = true

  # Bullet
  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
    Bullet.alert = true
    Bullet.honeybadger = true
    Bullet.rollbar = true
  end
end
