require_relative 'models/game'

# Prevent Ctrl+C for exiting
trap('INT', 'SIG_IGN')

Game.new.start
