#! /usr/bin/env ruby
# encoding:utf-8

require 'rubygems'
require 'optparse'
require 'mini_magick'
require 'curses'
include MiniMagick

opt = OptionParser.new

@filename = nil

@size = nil
opt.on("-o NAME") { |v| @filename = v }
opt.on("-s SIZE") { |s| @size=s.to_i }
opt.parse!(ARGV)

img = Image.open("#{ARGV[0]}")

if @size.nil? then 
  Curses.init_screen
  colnum=Curses.cols.to_s
  Curses.close_screen
  @size=colnum.to_i
end
unless @filename.nil? then 
  outfile=File::open(@filename,'w')
end
mimg = img.resize("#{@size}x#{(img.height*@size.to_f/img.width)*0.9}")
pixels = mimg.get_pixels
text=""
(mimg.height/2).times do |y|
  mimg.width.times do |x|
    back = pixels[2*y][x]
    ccol = pixels[2*y+1][x]
    key = 43
    re_b = (back[0]/key)
    gr_b = (back[1]/key)
    bl_b = (back[2]/key)
    re_c = (ccol[0]/key)
    gr_c = (ccol[1]/key)
    bl_c = (ccol[2]/key)
    colnum_back=16+re_b*36+gr_b*6+bl_b
    colnum_char=16+re_c*36+gr_c*6+bl_c
    text+="\e[48;5;#{colnum_back}m\e[38;5;#{colnum_char}m▅"
  end
  text+="\e[39m\e[49m\e[0m\n"
end
unless @filename==nil then 
  outfile.print text
  outfile.close
else
  print text 
end
