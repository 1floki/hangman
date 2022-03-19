# frozen_string_literal: true

# initates and play a new game of hangman
class NewGame
  def initialize(word_to_guess, display)
    @word_to_guess = word_to_guess.split('')
    @display = display
    @correctly_guessed = []
  end

  def play_game
    @attempts = 0
    @winner_declared = false
    @guessed_attempts_letter = []
    run_game until @attempts == 7 || @winner_declared
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
    puts "Guessed letters: #{@guessed_attempts_letter.join('')}"
  end

  def user_input
    loop do
      @input = gets.chomp
      if @guessed_attempts_letter.include?(@input)
        print "You've already made this guess. Try again...\n"
        next
      end
      break if @input.length == 1 && @input.to_i.to_s != @input

      puts 'Invalid input. Try again!'
    end
    @guessed_attempts_letter.push(@input)
  end

  def input_check
    if @word_to_guess.include?(@input)
      display_current_state
      puts 'Hurray! That was a correct guess!'
      @correctly_guessed.push(@input)
    else
      puts 'Uh-oh, that is incorrect!'
      @attempts += 1
      sleep(0.4)
    end
  end

  def check_if_game_ends
    if @word_to_guess.sort == @correctly_guessed.sort
      @winner_declared = true
      display_current_state
      puts "Congrats, you have succefully guess the word: #{@word_to_guess.join('')}"
    elsif @attempts == 7
      display_current_state
      puts "You've failed the game! The word was #{@word_to_guess.join('')}"
    end
  end
end
