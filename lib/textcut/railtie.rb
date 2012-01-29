# encoding: utf-8
require 'rails/railtie'

module Textcut

  class Railtie < ::Rails::Railtie
    
    initializer 'textcut' do |app|
    
    	if defined?(Mongoid::Document)
  			Mongoid::Document::ClassMethods.send(:include, ::Textcut::Base::SingletonMethods)
			elsif defined?(ActiveRecord::Base)
  			ActiveRecord::Base.send(:include, ::Textcut::Base)
			end  

    end # initializer

  end # Railtie
  
end # Textcut