require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StechApplicationTemplate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    def flatten_yaml(prefix, hash)
      hash.each_with_object({}) do |(k, v), h|
        key = prefix + k.to_s
        if v.is_a?(Hash)
          h.merge!(flatten_yaml("#{key}_", v))
        else
          h[key] = v
        end
      end
    end

    unless ENV["HOSTENV"] == "Heroku" || ENV['HOSTENV'] == 'Production'
      config.before_configuration do
        env_file = File.join(Rails.root, 'config', 'local_env.yml')
        if File.exist?(env_file)
          yaml_config = YAML.load_file(env_file)
          flatten_yaml("", yaml_config).each do |key, value|
            ENV[key.to_s] = value
          end
        end
      end
    end
    # Configuration for the application, engines, and railties goes here.

    # Enable the asset pipeline
    # config.assets.enabled = true

    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.

    config.time_zone = "Pacific Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
