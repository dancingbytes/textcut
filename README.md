Textcut
========

Cutting text for rails 3


### Supported environment

Ruby:   1.9.2, 1.9.3

Rails:  3.0, 3.1, 3.2


### Example

    # in model
    class Event < ActiveRecord::Base

      # options isn`t necessary
      textcut({
        :xpath => ".//span[@class='textcut']",
        :get => :content,
        :set => :description,
        :url_method => :link,
        :default_cut_title =>  "read more"
      })

      def link
        ...
      end

    end # End

    # use
    ev = Event.last

    # 1 (textcut mark without title -- will be set default title)
    ev.update_attributes!({ :content => "<p>test 1<span class='textcut'></span> <i>lol</i></p>" })

    # 2 (textcut mark with custom title)
    ev.update_attributes!({ :content => "<p>test 2<span class='textcut'>ReadMe</span> <i>lol</i></p>" })

    # 3 (without textcut mark)
    ev.update_attributes!({ :content => "<p>test 3 <i>lol</i></p>" })

    ev.content # full text
    ev.description # cutting text


### License

Authors: redfield (up.redfield@gmail.com), Tyralion (piliaiev@gmail.com)

Copyright (c) 2012 DansingBytes.ru, released under the BSD license