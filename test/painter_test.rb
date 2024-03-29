require "test_helper"
require "cairo"

class PainterTest < Test::Unit::TestCase
  def setup
    @painter = ShogiKoma::Painter.new
  end

  class SetFontTest < self
    def test_found
      part_of_name = "M"
      assert_match(/#{part_of_name}/, @painter.set_font(part_of_name))
    end

    def test_not_found
      part_of_name = "ABCDE12345"
      assert_nil(@painter.set_font(part_of_name))
    end
  end

  class DrawTest < self
    def test_one_character
      assert_nothing_raised_in_draw("A")
    end

    def test_two_characters
      assert_nothing_raised_in_draw("AB")
    end

    def test_three_characters
      assert_nothing_raised_in_draw("ABC")
    end

    def test_body_color_with_rgb
      @painter.set_body_rgb(0.2, 0.2, 0.2)
      assert_nothing_raised_in_draw("D")
    end

    def test_text_color_with_name
      @painter.set_text_color(:deep_pink)
      assert_nothing_raised_in_draw("E")
    end

    def test_text_color_with_hex
      @painter.set_text_color("#ACE")
      assert_nothing_raised_in_draw("G")
    end

    private
    def assert_nothing_raised_in_draw(text)
      width =  200
      height = 200
      assert_nothing_raised do
        Cairo::ImageSurface.new(:argb32, width, height) do |surface|
          Cairo::Context.new(surface) do |context|
            context.scale(width, height)
            @painter.draw(context, text)
          end
        end
      end
    end
  end
end
