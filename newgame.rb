# frozen_string_literal: true
require_relative('display')
require('yaml')
# frozen_string_literal: true

# initates and play a new game of hangman
class NewGame
  def initialize(word_to_guess, correctly_guessed = [], attempts = 0, guessed_attempts_letter = [])
    @word_to_guess = word_to_guess
    @display = Display.new
    @correctly_guessed = correctly_guessed
    @attempts = attempts
    @guessed_attempts_letter = guessed_attempts_letter
  end

  def play_game
    @winner_declared = false
    run_game until @attempts == 7 || @winner_declared || @input == 'save'
  end

  def run_game
    display_current_state
    user_input
    input_check
    check_if_game_ends
  end

  def display_current_state
    @display.show_display(@attempts)
    @display.display_hint(@word_to_guess, @guessed_attempts_letter)
    puts "All guessed letters: #{@guessed_attempts_letter.join(' | ')}"
  end

  def user_input(display_message = "Enter your guess. Or type 'save' to save the game")
    puts display_message
    @input = gets.chomp.downcase
    if @input == 'save'
      puts 'You chose to save the game.'
    elsif @guessed_attempts_letter.include?(@input)
      user_input("You've already made this guess. Try again...\n")
    elsif (('a'..'z').to_a).include?(@input)
      @guessed_attempts_letter.push(@input)
    else
      user_input('Invalid input try again!')
    end
  end

  def input_check
    if @word_to_guess.include?(@input)
      display_current_state
      puts 'Hurray! That was a correct guess!'
      @correctly_guessed.push(@input)
    elsif @input == 'save'
      save_file
    else
      puts 'Uh-oh, that is incorrect!'
      @attempts += 1
      sleep(0.4)
    end
  end

  def save_file
    Dir.mkdir('saved') unless Dir.exist?('saved')
    puts "Enter a name for save file:"
    @name = gets.chomp
    File.write("saved/#{@name}.yaml", to_yaml)  
  end

  def to_yaml
    YAML.dump({
      :word_to_guess => @word_to_guess,
      :correctly_guessed => @correctly_guessed,
      :attempts => @attempts,
      :guessed_attempts_letter => @guessed_attempts_letter
    })
  end

  def check_if_game_ends
    if @word_to_guess.sort == @correctly_guessed.sort
      @winner_declared = true
      display_current_state
      puts "Congrats, you have succefully guessed the word: #{@word_to_guess.join('')}"
    elsif @attempts == 7
      display_current_state
      puts "You've failed the game! The word was #{@word_to_guess.join('')}"
    end
  end
end
