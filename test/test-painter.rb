require "shogi_koma/painter"
require "cairo"

class PainterTest < Test::Unit::TestCase
  def setup
    @painter = ShogiKoma::Painter.new
  end

  def test_draw
    assert_nothing_raised do
      Cairo::ImageSurface.new(:argb32, 100, 100) do |surface|
        Cairo::Context.new(surface) do |context|
          @painter.draw(context, "A")
        end
      end
    end
  end
end
