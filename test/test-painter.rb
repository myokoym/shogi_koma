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
