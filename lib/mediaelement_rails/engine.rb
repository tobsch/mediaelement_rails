require "rails/engine"
require "jquery-rails"

module MediaelementRails
  class Engine < Rails::Engine
    config.after_initialize do |app|
      next unless app.assets
      app.assets.register_mime_type "application/x-silverlight-app", ".xap"
    end
  end
end
