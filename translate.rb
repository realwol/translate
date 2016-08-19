require 'sinatra'
require "sinatra/reloader" if development?

require 'pry'
require 'net/https'
require 'open-uri'
require 'nokogiri'
require 'easy_translate'

#setting
set :bind, '0.0.0.0'
set :port, 4567
EasyTranslate.api_key = 'AIzaSyB3MKHWN3fXuKX7UjvtsoX5AamscLCQY3g'

get '/translate/*/to/*' do
  a = Time.now
  t = params['splat'].first.split('&')
  p = params['splat'][1]
  result = EasyTranslate.translate(t, :to => p)
  "#{result}"
end