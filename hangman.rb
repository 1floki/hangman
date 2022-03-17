# frozen_string_literal: true

require_relative('display')
require_relative('dictionary')
require_relative('game')

# plays game of hangman
class Hangman
  def initialize
    @display = Display.new
  end

  def play_game
    @display.introduction
    selection = ask_for_load_or_new
    case selection
    when 'N'
      play_new_game
    when 'L'
      load_saved_game
    end
  end

  def ask_for_load_or_new
    loop do
      @loadgame = gets.chomp
      break if @loadgame == 'N' || @loadgame == 'L'

      puts "Invalid Input. \n [N] New Game \n [L] Load Saved Game"
    end
    @loadgame
  end

  def load_saved_game
    # load_saved_game
  end

  def play_new_game
    @word_for_new_game = Dictionary.new(File.readlines('words.txt', chomp: true))
    Game.new(0, @word_for_new_game.random_word_select, []).play_game
  end

  def game_stopped
    # return true or false
  end
end

game = Hangman.new
game.play_game