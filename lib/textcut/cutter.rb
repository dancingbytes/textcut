# encoding: utf-8
require 'nokogiri'

module Textcut

  class Cutter

    TEMP_TAG = "textcut_temp_tag"

    def initialize(content, default_cut_title)

      @doc = ::Nokogiri::HTML::DocumentFragment.parse("<#{TEMP_TAG}>#{content}</#{TEMP_TAG}>")
      @default_cut_title = default_cut_title

    end # new

    def cut(xpath, url)

      @doc.search(xpath).each do |node|

        @tag = node
        while node
          clear(node)
          node = node.respond_to?(:parent) ? node.parent : nil
        end
        replace(url)

      end
      @doc.search(".//#{TEMP_TAG}").inner_html

    end # cut

    private

    def replace(url)

      replaced_by = url.blank? ? "" : "<a href=\"#{url}\">#{cut_title}</a>"
      @tag.replace( ::Nokogiri::HTML::fragment(replaced_by) )
      
    end  # replace

    def clear(node)

      while (ns = node.next_sibling)
        ns.remove
      end

    end # clear

    def cut_title
      @title ||= ( @tag.text().empty? ? @default_cut_title : @tag.text() ).strip
    end # cut_title

  end # Cutter

end # Textcut