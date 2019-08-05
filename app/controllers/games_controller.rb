class GamesController < ApplicationController
  def new
    # display a new random grid and a form
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    if params[:answer] == ''
      @response = "sorry, but you must enter a word."
    elsif params[:answer].chars.all? { |char| params[:letters].include? char.downcase }
      @response = "Good job! #{params[:answer].upcase} can be built out of #{params[:letters].split.join(", ")}."
    else
      @response = "Sorry, but #{params[:answer].upcase} can't be built out of #{params[:letters].split.join(", ")}."
    end
    # byebug
    # The form will be submitted (with POST) to the score action.
  end
end

# string.chars.any? { |char| ('a'..'z').include? char.downcase }
