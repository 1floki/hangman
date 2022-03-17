class Game
    def initialize(attempts, word_to_guess, attempted_guess)
        @attempts = attempts
        @word_to_guess = word_to_guess
        @attempted_guess = attempted_guess
    end

    def play_game
        puts @word_to_guess
    end
end