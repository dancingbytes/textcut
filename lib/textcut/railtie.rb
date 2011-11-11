# encoding: utf-8
require 'textcut'
require 'rails/railtie'

module Textcut

  class Railtie < ::Rails::Railtie
    
    config.before_initialize do

      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.send :include, Textcut::Base
      end

    end # before_initialize

    def self.extend_active_record
      ActiveRecord::Base.send :include, Textcut::Base
    end # extend_active_record

  end # Railtie
  
end # Textcut