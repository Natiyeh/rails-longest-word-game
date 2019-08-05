require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    # display a new random grid and a form
    @letters = ('a'..'z').to_a.sample(10)
  end

  def included?(guess, grid)
    guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }

  end

  def score
    if included?(params[:answer], params[:letters])
      if english_word?(params[:answer])
        @response = "Good job! #{params[:answer].upcase} can be built out of #{params[:letters].split.join(", ")}."
      else
        @response = "Sorry, but #{params[:answer].upcase} is not an english word."
      end
    else
      @response = "Sorry, but one or more letters in #{params[:answer].upcase} is not part of #{params[:letters].split.join(", ")}."
    end
    # byebug
    # The form will be submitted (with POST) to the score action.
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end
end

# string.chars.any? { |char| ('a'..'z').include? char.downcase }
