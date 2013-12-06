#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "shogi_koma"

painter = ShogiKoma::Painter.new
painter.width = 100
painter.height = 100
painter.font = "IPAMincho"
painter.write_to_png("歩", "fu.png")
