require "rails"

module Tailwindcss
  class Engine < ::Rails::Engine
    initializer "tailwindcss.assets" do |app|
      if Rails::VERSION::MAJOR == 5
        # Rails 5 compatibility mode
        app.config.assets.precompile += %w( inter-font.css tailwind.css )
        app.config.assets.paths << root.join("app/assets/builds")
      else
        Rails.application.config.assets.precompile += %w( inter-font.css )
      end
    end

    initializer "tailwindcss.disable_generator_stylesheets" do
      Rails.application.config.generators.stylesheets = false
    end

    config.app_generators do |g|
      g.template_engine :tailwindcss
    end
  end
end
