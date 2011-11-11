# encoding: utf-8
module Textcut

  module Base

    def self.included(base)
      base.extend(SingletonMethods)
    end # self.included

    module SingletonMethods

      def textcut(options = {})

        options[:xpath] ||= ".//span[@class='textcut']"
        options[:default_cut_title] ||= "more"

        Textcut::Manager.builder(self, options)

      end # textcut

    end # SingletonMethods

  end # Base

end # Textcut