g2c-graphic_to_character
========================
# g2c-graphic_to_character

## 概要

画像を読み込んで256色ターミナルで標示できるようなテキストファイルを生成するスクリプトです。

素朴な実装です。

## 要るgem

 * ImageMagick
 * optperse
 * curses
 
 ## 使い方
 
 g2c.rb 画像ファイル -o 出力ファイル名 -s　出力するテキストファイルの横幅
 
 -sは指定しないと自動的に現在のターミナルの横幅になります。
