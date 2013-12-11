require "shogi_koma/painter"
require "cairo"

class PainterTest < Test::Unit::TestCase
  def setup
    @painter = ShogiKoma::Painter.new
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

    def test_change_options
      test_opts = {
        bg_red:    0.2,
        bg_green:  0.2,
        bg_blue:   0.2
      }
      assert_nothing_raised_in_draw("D", test_opts)
    end

    def test_text_color_with_name
      assert_nothing_raised_in_draw("E", txt_color: :deep_pink)
    end

    def test_text_color_with_hex
      assert_nothing_raised_in_draw("G", txt_color: "#ACE")
    end

    private
    def assert_nothing_raised_in_draw(text, options={})
      width =  200
      height = 200
      assert_nothing_raised do
        Cairo::ImageSurface.new(:argb32, width, height) do |surface|
          Cairo::Context.new(surface) do |context|
            context.scale(width, height)
            @painter.draw(context, text, options)
          end
        end
      end
    end
  end
end
