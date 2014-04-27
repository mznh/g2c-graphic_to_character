#! /usr/bin/env ruby
# encoding:utf-8

require 'rubygems'
require 'RMagick'
require 'RMagick'
include Magick

img = ImageList.new("#{ARGV[0]}")
p ARGV[0]
p img.columns
#mimg = img.resize(160,96)
mimg = img.resize(ARGV[1].to_i,(img.rows*ARGV[1].to_f/img.columns)*0.9)
text=""
for y in 0...mimg.rows/2
  for x in 0...mimg.columns
    back = mimg.pixel_color(x, 2*y)
    ccol = mimg.pixel_color(x, 2*y+1)
    re_b = (back.red/255/43)
    gr_b = (back.green/255/43)
    bl_b = (back.blue/255/43)
    re_c = (ccol.red/255/43)
    gr_c = (ccol.green/255/43)
    bl_c = (ccol.blue/255/50)
    colnum_back=16+re_b*36+gr_b*6+bl_b
    colnum_char=16+re_c*36+gr_c*6+bl_c
    text+="\e[48;5;#{colnum_back}m\e[38;5;#{colnum_char}m▅"
  end
  text+="\e[39m\e[49m\e[0m\n"
end
print text
