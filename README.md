# ShogiKoma

An image generator for Shogi's pieces (it's "ko-ma" in Japanese) for Ruby by cairo.

It supports one or two characters.

![fu1](http://myokoym.net/public/shogi_koma-fu1.png)
![fu2](http://myokoym.net/public/shogi_koma-fu2.png)

## Requirements

* [Ruby](https://www.ruby-lang.org/)
* [rcairo](https://github.com/rcairo/rcairo)
* [cairo](http://cairographics.org/)

## Installation

Add this line to your application's Gemfile:

    gem "shogi_koma"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shogi_koma

## Usage

### Write to PNG

```ruby
require "shogi_koma"

painter = ShogiKoma::Painter.new
#painter.width = 200        # as default
#painter.height = 200       # as default
#painter.font = "xxx"       # default: "Hiragino Mincho" or "MS Mincho" or "Noto"
painter.write_to_png("歩", "shogi_koma-fu1.png")
painter.write_to_png("歩兵", "shogi_koma-fu2.png")
```

### Draw to Cairo::Context

```ruby
require "cairo"
require "shogi_koma"

width  = 200
height = 200

Cairo::ImageSurface.new(:argb32, width, height) do |surface|
  Cairo::Context.new(surface) do |context|
    context.scale(width, height)
    painter = ShogiKoma::Painter.new
    painter.draw(context, "歩")
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
