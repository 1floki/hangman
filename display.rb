class Display
    def initialize
        
    end

    def introduction
        puts %{ 
            
            ██   ██  █████  ███    ██  ██████  ███    ███  █████  ███    ██ 
            ██   ██ ██   ██ ████   ██ ██       ████  ████ ██   ██ ████   ██ 
            ███████ ███████ ██ ██  ██ ██   ███ ██ ████ ██ ███████ ██ ██  ██ 
            ██   ██ ██   ██ ██  ██ ██ ██    ██ ██  ██  ██ ██   ██ ██  ██ ██ 
            ██   ██ ██   ██ ██   ████  ██████  ██      ██ ██   ██ ██   ████ 
            
        ➠ The objective is to save Steve from getting hung up on accusations of witchery. You get 7 turns.

        ➠ All words are pulled from a dictionary and will be 5 - 12 characters long.

        ➠ You'll be able to guess a letter or the entire word if you already figure it out.
        
        [N] New Game
        [L] Load Saved Game
        }

    end

    def show_display(picturecode)
        hangmanpics =  ['''
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
end