#!/usr/bin/env ruby

require 'mini_magick'
include MiniMagick

img = Image.open(ARGV[0])
img.resize "5x5"
p img.get_pixels
