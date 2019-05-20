class GamesController < ApplicationController
  def new
    # display a new random grid and a form
    @letters = ('a'..'z').to_a.sample(10)
    @letters
  end

  def score
    # The form will be submitted (with POST) to the score action.

  end
end
