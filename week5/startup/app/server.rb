require 'sinatra'
require 'sinatra/reloader'
require 'rack-flash'
require 'sinatra/partial'
require 'sinatra/formkeeper'
require 'json'

require_relative 'models/sum.rb'
require_relative 'models/minus'
require_relative 'models/square_cube'
require_relative 'models/largest_num'
require_relative 'models/question'
require_relative 'models/prime_identification'
require_relative 'models/tower'
require_relative 'models/the_power_of'
require_relative 'models/no_idea'
require_relative 'models/scrabble'

Sinatra::Application.set :bind, '0.0.0.0'

get '/' do
  begin
   klass =  Question.new(params['q']).identify
   puts "using #{klass}"
   klass.new(params['q']).answer
  rescue
    puts "Error on #{params.inspect}"
    "No idea"
  end
end
