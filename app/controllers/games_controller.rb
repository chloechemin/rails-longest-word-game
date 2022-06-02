require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
  alphabet = ('a'..'z').to_a
  $letters = alphabet.sample(10)
  end

  def score
    keyword = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{keyword}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
    @found = user["found"]
  end
end
