require "cairo"

module ShogiKoma
  class Painter
    attr_accessor :width, :height, :font
    def initialize
      @width = 200
      @height = 200
      @font = "IPAMincho"
    end

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
      send("draw_text#{text.length}", context, text)
    end

    def draw_body(context)
      context.set_line_width(0.01)
      context.move_to(0.2, 0.2)
      context.line_to(0.5, 0.1)
      context.line_to(0.8, 0.2)
      context.line_to(0.9, 0.9)
      context.line_to(0.1, 0.9)
      context.close_path
      context.set_source_rgb(1, 0.8, 0.2)
      context.fill_preserve
      context.set_source_color(:black)
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
      text = text[0] if text.is_a?(Array)
      context.select_font_face(@font)
      context.font_size = 0.6
      context.move_to(0.2, 0.75)
      context.show_text(text)
    end

    def draw_text2(context, text)
      context.select_font_face(@font)
      context.font_size = 0.4
      context.move_to(0.3, 0.49)
      context.show_text(text[0])
      context.move_to(0.3, 0.85)
      context.show_text(text[1])
    end
  end
end
