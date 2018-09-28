class Outputs
  LINE_LENGTH = 72

  def welcome
    'Welcome to the Blackjack game'.center(LINE_LENGTH)
  end

  def logo
    %q(
.------..------..------..------..------..------..------..------..------.
|B.--. ||L.--. ||A.--. ||C.--. ||K.--. ||J.--. ||A.--. ||C.--. ||K.--. |
| :(): || :/\: || (\/) || :/\: || :/\: || :(): || (\/) || :/\: || :/\: |
| ()() || (__) || :\/: || :\/: || :\/: || ()() || :\/: || :\/: || :\/: |
| '--'B|| '--'L|| '--'A|| '--'C|| '--'K|| '--'J|| '--'A|| '--'C|| '--'K|
`------'`------'`------'`------'`------'`------'`------'`------'`------'
).freeze
  end

  def wait_to_start
    'Press Enter to start a new game or ESC to quit...'.center(LINE_LENGTH)
  end

  def splash_screen
    system 'clear'
    puts welcome
    puts logo
    puts wait_to_start
  end

  def scores(opts, hide)
    system 'clear'
    puts logo
    puts "At stake: #{opts[:bank]}$".rjust(LINE_LENGTH)
    puts '=' * LINE_LENGTH

    scores!(opts, hide)
  end

  def error(error)
    puts error
    sleep 1
  end

  def scores!(opts, hide)
    print "#{opts[:dealer].name}: "
    if hide
      puts opts[:dealer].hide_cards
    else
      print opts[:dealer].display_cards
      print "| Score: #{opts[:dealer].score} | Cash: #{opts[:dealer].cash}$\n"
    end

    print "#{opts[:player].name}: #{opts[:player].display_cards}"
    puts "| Score: #{opts[:player].score} | Cash: #{opts[:player].cash}$"
  end

  def winner(player)
    puts player ? "Winner #{player.name}!" : 'Draw...'
  end
end
