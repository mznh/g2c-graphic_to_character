#! /usr/bin/env ruby
# encoding:utf-8

require 'rubygems'
require 'RMagick'
require 'RMagick'
include Magick

def rgb_to_hsv r, g, b
  r /= 255.0
  g /= 255.0
  b /= 255.0
  cmax = [r, g, b].max
  cmin = [r, b, g].min
  d = cmax - cmin
  return [0, 0, (cmax * 100).floor] if d == 0
  h = case cmax
      when r then 60 * ((g - b) / d % 6)
      when g then 60 * ((b - r) / d + 2)
      else        60 * ((r - g) / d + 4)
      end
  [ h,
    d / cmax * 100,
    cmax * 100
    ].map &:floor
end


p rgb_to_hsv( 255, 0 ,0 )
p rgb_to_hsv( 0, 255 ,0 )
p rgb_to_hsv( 0, 0, 255 )
p rgb_to_hsv( 255, 255 ,0 )
p rgb_to_hsv( 0, 255 ,255 )
p rgb_to_hsv( 255 ,255 ,0 )
p rgb_to_hsv( 255 ,0 ,255 )
