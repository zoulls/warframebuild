module Tags
  class TabsBlock < Liquid::Block
    def initialize(tag_name, menu_name, tokens)
      super
      @menu_name = menu_name.split(',')
    end

    def render(context)
      tab_id = super.scan(/div id="(.*)" class="tab-pane"/)
      li_menu = ''
      i = 0
      tab_id.each do |id|
        li_menu += '<li><a data-toggle="tab" href="#'+ id[0] +'">'+ @menu_name[i] +'</a></li>'
        i += 1
      end

      '<ul class="nav nav-tabs">' + li_menu + '</ul><div class="tab-content">' + super + '</div>'
    end
  end

  class TabBlock < Liquid::Block
    def initialize(tag_name, tab, tokens)
      super
      @tab = tab.strip
    end

    def render(context)
      return "" if @tab.empty?

      site      = context.registers[:site]
      converter = site.find_converter_instance(Jekyll::Converters::Markdown)

      lines = super.rstrip.split(/\r\n|\r|\n/).select { |line| line.size > 0 }
      indentation = lines.map do |line|
        match = line.match(/^(\s+)[^\s]+/)
        match ? match[1].size : 0
      end
      indentation = indentation.min

      content = indentation ? super.gsub(/^#{' |\t' * indentation}/, '') : super
      content = converter.convert(content)
      content = content.strip # Strip again to avoid "\n"

      '<div id="' + @tab + '" class="tab-pane">' + content + '</div>'
    end
  end
end

Liquid::Template.register_tag("tabs", Tags::TabsBlock)
Liquid::Template.register_tag("tab",  Tags::TabBlock)