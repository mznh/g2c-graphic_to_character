#! /usr/bin/env ruby
# encoding: utf-8

require 'readline'
require 'curses'

Curses.init_screen

p Curses.cols
p ENV['LINES']

