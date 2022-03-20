require_relative('lib/dictionary')
require_relative('lib/display')
require_relative('lib/hangman')
require_relative('lib/newgame')

game = Hangman.new
game.play_game