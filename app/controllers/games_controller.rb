require 'open-uri'
require 'json'

class GamesController < ApplicationController
  # before_filter :set_total_score

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
        @response = "Good job! #{params[:answer].upcase} is a valid English word!"
      else
        @response = "Sorry, but #{params[:answer].upcase} is not a valid english word."
      end
    else
      @response = "Sorry, but #{params[:answer].upcase} can't be built out of #{params[:letters].split.join(", ")}."
    end
    # byebug
    # The form will be submitted (with POST) to the score action.
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end

  # def set_total_score
  #   @total = session[:total]
  #   @breadcrumbs = session[:breadcrumbs]
  #   @total ||= Array.new
  #   @total.push(request.url)
  #   if @breadcrumbs.count > 3
  #     @breadcrumbs.shift
  #   end
  #   session[:breadcrumbs] = @breadcrumbs
  # end
end

# string.chars.any? { |char| ('a'..'z').include? char.downcase }
