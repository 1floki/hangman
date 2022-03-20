# frozen_string_literal: true

class Display
  def initialize; end

  def introduction
    puts %(

            ██   ██  █████  ███    ██  ██████  ███    ███  █████  ███    ██
            ██   ██ ██   ██ ████   ██ ██       ████  ████ ██   ██ ████   ██
            ███████ ███████ ██ ██  ██ ██   ███ ██ ████ ██ ███████ ██ ██  ██
            ██   ██ ██   ██ ██  ██ ██ ██    ██ ██  ██  ██ ██   ██ ██  ██ ██
            ██   ██ ██   ██ ██   ████  ██████  ██      ██ ██   ██ ██   ████

        ➠ The objective is simple: guess the word to save the falsely accused. You get 7 turns.

        ➠ All words are pulled from a dictionary and will be 5 - 12 characters long.

        ➠ You'll be able to guess one letter at a time.

        [N] New Game
        [L] Load Saved Game
        )
  end

  def show_display(picturecode)
    system('clear')
    puts "#{7 - picturecode} attempts remaining."
    hangmanpics = ['''
          +---+
              |
              |
              |
              |
              |
        =========''', '''
            +---+
            |   |
                |
                |
                |
                |
          =========''', '''
            +---+
            |   |
            O   |
                |
                |
                |
          =========''', '''
            +---+
            |   |
            O   |
            |   |
                |
                |
          =========''', '''
            +---+
            |   |
            O   |
           /|   |
                |
                |
          =========''', '''
            +---+
            |   |
            O   |
           /|\  |
                |
                |
          =========''', '''
            +---+
            |   |
            O   |
           /|\  |
           /    |
                |
          =========''', '''
            +---+
            |   |
            O   |
           /|\  |
           / \  |
                |
          =========''']
    puts hangmanpics[picturecode]
  end

  def display_hint(letters_to_guess, guessed_letters)
    @hint_show = []
    letters_to_guess.each do |element|
      if guessed_letters.include?(element)
        @hint_show.push(element)
      else
        @hint_show.push('_')
      end
    end
    puts @hint_show.join(' ')
  end
end
