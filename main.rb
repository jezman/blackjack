require_relative 'models/game'
require_relative 'models/outputs'
require_relative 'models/inputs'

# Prevent Ctrl+C for exiting
trap('INT', 'SIG_IGN')

Game.new.start
