#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "shogi_koma"

painter = ShogiKoma::Painter.new
painter.width = 200
painter.height = 200
painter.font = "IPAMincho"
painter.write_to_png("歩", "shogi_koma-fu1.png")
painter.write_to_png("歩兵", "shogi_koma-fu2.png")

painter.set_text_color(:red)
painter.write_to_png("と", "shogi_koma-fu3.png")

painter.set_body_rgba(0.2, 0.2, 0.9, 0.1)
painter.set_frame_color("#CC00FF")
painter.write_to_png("と", "shogi_koma-fu4.png")
