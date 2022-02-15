require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(8)
  end

  def score
    @letters = params[:letters].split

    @word = params[:word]
    splitted_words = @word.split("")
    splitted_words.each do |splitted_word|
      @letters.include?(splitted_word)

    end

    response = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}")
    json = JSON.parse(response.read)
    json[:found]
  end
end
