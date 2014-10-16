# coding: utf-8
require 'rails'

module Apress
  module AmazonAssets
    class Engine < ::Rails::Engine
      config.autoload_paths += Dir["#{config.root}/lib"]

      # Initializer allows to use engine factories
      # from a project which depends on the engine
      initializer :apress_amazon_assets_factories, :after => "factory_girl.set_factory_paths" do |app|
        if defined?(FactoryGirl)
          FactoryGirl.definition_file_paths.unshift root.join('spec', 'factories')
        end
      end

      initializer :apress_amazon_assets_migrations do |app|
        unless app.root.to_s.match root.to_s
          app.config.paths["db/migrate"] += config.paths["db/migrate"].expanded
        end
      end

      rake_tasks do
        load 'apress/amazon_assets/tasks.rake'
      end
    end
  end
end