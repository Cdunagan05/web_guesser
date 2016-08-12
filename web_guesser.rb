require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = display_message(guess)
  erb :index, :locals => {:message => message,
                          :color => @color}
end


def display_message(guess)
  if guess > (NUMBER + 5)
    @color = "red"
    @message = "WAY too high!"
  elsif guess < (NUMBER - 5)
    @color = "red"
    @message = "WAY too low!"
  elsif guess > NUMBER
    @color = "yellow"
    @message = "Too high!"
  elsif guess < NUMBER
    @color = "yellow"
    @message = "Too low!"
  else
    @color = "green"
    @message = "CORRECT! The secret number was #{NUMBER}!"
  end
end
