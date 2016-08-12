require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = display_message(guess)
  erb :index, :locals => {:number => NUMBER,
                          :message => message}
end


def display_message(guess)
  guess = guess.to_i
  if guess > (NUMBER + 5)
    @message = "WAY too high!"
  elsif guess < (NUMBER - 5)
    @message = "WAY too low!"
  elsif guess > NUMBER
    @message = "Too high!"
  elsif guess < NUMBER
    @message = "Too low!"
  else
    @message = "CORRECT! The secret number was #{NUMBER}!"
  end
end
