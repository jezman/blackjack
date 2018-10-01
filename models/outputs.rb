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
    puts "error: #{error}"
    sleep 1
  end

  def scores!(opts, hide)
    dname = "#{opts[:dealer].name}: "
    if hide
      puts "#{dname}???"
      puts opts[:dealer].hide_cards
    else
      puts "#{dname} #{opts[:dealer].score}"
      puts opts[:dealer].display_cards
    end

    puts "#{opts[:player].name}: #{opts[:player].score}"
    puts "#{opts[:player].display_cards}"
    puts "Cash: #{opts[:player].cash}$"
  end

  def winner(player)
    puts player ? "Winner #{player.name}!" : 'Draw...'
  end
end
