require "shogi_koma/painter"
require "cairo"

class PainterTest < Test::Unit::TestCase
  def setup
    @painter = ShogiKoma::Painter.new
  end

  class DrawTest < self
    def test_one_character
      width =  200
      height = 200
      assert_nothing_raised do
        Cairo::ImageSurface.new(:argb32, width, height) do |surface|
          Cairo::Context.new(surface) do |context|
            context.scale(width, height)
            @painter.draw(context, "A")
          end
        end
      end
    end

    def test_two_characters
      width =  200
      height = 200
      assert_nothing_raised do
        Cairo::ImageSurface.new(:argb32, width, height) do |surface|
          Cairo::Context.new(surface) do |context|
            context.scale(width, height)
            @painter.draw(context, "AB")
          end
        end
      end
    end

    def test_three_characters
      width =  200
      height = 200
      assert_nothing_raised do
        Cairo::ImageSurface.new(:argb32, width, height) do |surface|
          Cairo::Context.new(surface) do |context|
            context.scale(width, height)
            @painter.draw(context, "ABC")
          end
        end
      end
    end
  end
end
