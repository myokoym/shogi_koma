require "cairo"
require "fontdock"

module ShogiKoma
  class Painter
    attr_accessor :width, :height, :font
    attr_reader :body_color, :frame_color, :text_color
    def initialize
      @width = 200
      @height = 200
      @font = "IPAMincho"
      set_body_rgb(1, 0.8, 0.2)
      set_frame_color(:black)
      set_text_color(:black)
    end

    def set_font(part_of_font_name)
      font = find_font(part_of_font_name)
      @font = font if font
    end

    def find_font(part_of_font_name)
      found = Fontdock::Local.names.find do |name|
        /\A#{part_of_font_name}/i =~ name
      end
      return found if found

      found = Fontdock::Local.names.find do |name|
        /\A#{part_of_font_name}/ =~ name
      end
      return found if found

      found = Fontdock::Local.names.find do |name|
        /#{part_of_font_name}/ =~ name
      end
      return found if found

      Fontdock::Local.names.find do |name|
        /#{part_of_font_name}/i =~ name
      end
    end

    def set_body_color(color)
      @body_color = Cairo::Color.parse(color)
    end

    def set_body_rgba(r, g, b, a=1.0)
      @body_color = Cairo::Color.parse([:rgba, r, g, b, a])
    end
    alias :set_body_rgb :set_body_rgba

    def set_frame_color(color)
      @frame_color = Cairo::Color.parse(color)
    end

    def set_frame_rgba(r, g, b, a=1.0)
      @frame_color = Cairo::Color.parse([:rgba, r, g, b, a])
    end
    alias :set_frame_rgb :set_frame_rgba

    def set_text_color(color)
      @text_color = Cairo::Color.parse(color)
    end

    def set_text_rgba(r, g, b, a=1.0)
      @text_color = Cairo::Color.parse([:rgba, r, g, b, a])
    end
    alias :set_text_rgb :set_text_rgba

    def write_to_png(text, output_path)
      Cairo::ImageSurface.new(:argb32, @width, @height) do |surface|
        Cairo::Context.new(surface) do |context|
          context.scale(@width, @height)
          draw(context, text)
        end
        surface.write_to_png(output_path)
      end
    end

    def draw(context, text)
      draw_body(context)
      text = divide(text)
      __send__("draw_text#{text.length}", context, text)
    end

    def draw_body(context)
      context.set_line_width(0.01)
      context.move_to(0.2, 0.2)
      context.line_to(0.5, 0.1)
      context.line_to(0.8, 0.2)
      context.line_to(0.9, 0.9)
      context.line_to(0.1, 0.9)
      context.close_path
      context.set_source_color(@body_color)
      context.fill_preserve
      context.set_source_color(@frame_color)
      context.stroke
    end

    def divide(text)
      case text.length
      when 1
        text
      when 2
        if text.bytes.to_a.length == 2
          [text]
        else
          text
        end
      else
        if text[0].bytes.to_a.length == 1 && text[1].bytes.to_a.length == 1
          [text[0..1], text[2..-1]]
        else
          [text[0], text[1..-1]]
        end
      end
    end

    def draw_text1(context, text)
      context.set_source_color(@text_color)
      text = text[0] if text.is_a?(Array)
      context.select_font_face(@font)
      context.font_size = 0.6
      context.move_to(0.2, 0.75)
      context.show_text(text)
    end

    def draw_text2(context, text)
      context.set_source_color(@text_color)
      context.select_font_face(@font)
      context.font_size = 0.4
      context.move_to(0.3, 0.49)
      context.show_text(text[0])
      context.move_to(0.3, 0.85)
      context.show_text(text[1])
    end
  end
end
