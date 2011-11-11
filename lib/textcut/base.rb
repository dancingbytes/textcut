# encoding: utf-8
module Textcut

  module Base

    #
    # ev = Event.last
    # ev.update_attributes!({ :content => "<p>test 1<span class='textcut'></span> <i>lol</i></p>" })
    # Event.last.update_attributes!({ :content => "<p>test 2<span class='textcut'>ReadMe</span> <i>lol</i></p>" })
    # Event.last.update_attributes!({ :content => "<p>test 3 <i>lol</i></p>" })
    #
    # ev.content
    # ev.content_cut
    # Event.last.description

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