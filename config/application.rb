require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Proyecto
  class Application < Rails::Application

    config.load_defaults 7.0

    config.assets.paths << Rails.root.join('app', 'assets')

    Dir.glob("#{Rails.root}/app/assets/images/**").each do |path|
      config.assets.paths << path
    end
  end
end
