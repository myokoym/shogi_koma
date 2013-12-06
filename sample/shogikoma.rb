#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "shogi_koma"

painter = ShogiKoma::Painter.new
painter.width = 200
painter.height = 200
painter.font = "IPAMincho"
painter.write_to_png("歩", "shogi_koma-fu1.png")
painter.write_to_png("歩兵", "shogi_koma-fu2.png")
