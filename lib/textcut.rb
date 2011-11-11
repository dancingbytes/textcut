# encoding: utf-8
module Textcut

  autoload :Manager,  'textcut/manager'
  autoload :Cutter,   'textcut/cutter'
  autoload :TagList,  'textcut/tag_list'
  autoload :Base,     'textcut/base'

end # Textcut

if defined?(Mongoid::Document)
  Mongoid::Document::ClassMethods.send(:include, Textcut::Base::SingletonMethods)
end

if defined?(ActiveRecord::Base)
  require 'textcut/railtie'
end  