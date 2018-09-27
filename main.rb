require_relative 'models/app.rb'

# Prevent Ctrl+C for exiting
trap('INT', 'SIG_IGN')

App.new.start
