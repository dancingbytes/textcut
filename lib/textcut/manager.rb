# encoding: utf-8
module Textcut

  class Manager
    
    def self.builder(context, options)

      if options[:set].nil?

        unless context.method_defined?("#{options[:get]}_cut".to_sym)

          context.class_eval <<-"end_eval", __FILE__, __LINE__

            def #{options[:get]}_cut

              Textcut::Cutter.new(
                self.#{options[:get]},
                  "#{options[:default_cut_title]}"
                ).cut("#{options[:xpath]}", #{options[:url_method]})
            end

          end_eval

        end # unless

      else

        unless context.method_defined?(:textcut)

          context.class_eval <<-"end_eval", __FILE__, __LINE__

            def textcut
              @textcut ||= Textcut::Manager.new(self, #{options})
            end # textcut

            before_save ->() { textcut.cut }

          end_eval

         end # unless

      end # if

    end # builder

    def initialize(obj, options)
      
      @obj = obj
      @config = options
      
      if @config[:get].nil?
        raise "Option :get must be setted!"
      elsif !@obj.respond_to?(@config[:get].to_sym)
        raise "Method #{@config[:get]} does not exist!"
      end

    end # new

    def cut

      return unless @obj.has_attribute?(@config[:get].to_sym)
      return unless @obj.send("#{@config[:get]}_changed?".to_sym)

      @obj.send("#{@config[:set]}=".to_sym,

        Textcut::Cutter.new(
          @obj.send(@config[:get].to_sym),
          @config[:default_cut_title]
        ).cut(xpath, cut_url)

      )
        
    end # cut

    private

    def xpath
      @xpath ||= @config[:xpath]
    end # xpath

    def correct_url(url)
      ((url =~ /^((http|https|ftp)\:\/\/|\/)/).nil?) ? "/#{url}" : url
    end # correct_url

    def cut_url
      @cut_url ||= correct_url(@obj.send(@config[:url_method].to_sym)) unless @config[:url_method].nil?
    end # cut_url

  end # Manager

end # Textcut