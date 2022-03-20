# frozen_string_literal: true

require_relative('display')
require_relative('dictionary')
require_relative('newgame')
require('yaml')
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
    @file_name = select_file_name_to_load
    @data = YAML.load_file(@file_name)
    NewGame.new(@data[:word_to_guess], @data[:correctly_guessed], @data[:attempts],
                @data[:guessed_attempts_letter]).play_game
  end

  def play_new_game
    @word_for_new_game = Dictionary.new(File.readlines('words.txt', chomp: true))
    @word_for_new_game = @word_for_new_game.random_word_select
    @word_for_new_game = @word_for_new_game.split('')
    NewGame.new(@word_for_new_game).play_game
  end

  def select_file_name_to_load
    system('clear')
    puts 'Enter the name of the save file from the following: '
    @show_file_name = Dir['saved/*.yaml']
    @show_file_name.each { |file| puts file.gsub('saved/', '').gsub('.yaml', '') }
    @get_file_name = gets.chomp until @show_file_name.include?("saved/#{@get_file_name}.yaml")
    "saved/#{@get_file_name}.yaml"
  end
end
