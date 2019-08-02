class GamesController < ApplicationController
  def new
    # display a new random grid and a form
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    # byebug
    # The form will be submitted (with POST) to the score action.
  end
end

