# -*- encoding : utf-8 -*-
require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Imgosaurus
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)
    config.encoding        = 'utf-8'
  end
end
