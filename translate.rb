require 'sinatra'
require "sinatra/reloader" if development?
require 'pry'
require 'net/https'
require 'open-uri'
require 'easy_translate'
require 'bing_translator'

#setting
set :bind, '0.0.0.0'
set :port, 4567
set :environment, :production
EasyTranslate.api_key = 'AIzaSyB3MKHWN3fXuKX7UjvtsoX5AamscLCQY3g'

get '/translate/*/to/*' do
  t = params['splat'].first.split('&')
  p = params['splat'][1]
  result = EasyTranslate.translate(t, :to => p)
  "#{result}"
end

get '/btranslate/*/to/*' do
  t = params['splat'].first
  p = params['splat'][1]
  @BingTranslate =BingTranslator.new('amazon_tmall_translate','73niRgqDpecdRvWW9CDm+pqSUaUiDPpu0KqocXgW16o=')
  result = @BingTranslate.translate(t, to: p)
  "#{result}"
end

Process.daemon
