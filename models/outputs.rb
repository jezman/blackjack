require 'colorize'

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
).freeze.colorize(:red)
  end

  def wait_to_start
    'Press Enter to start a new game or ESC to quit...'.center(LINE_LENGTH)
  end

  def splash_screen
    system 'clear'
    puts welcome.colorize(:green)
    puts logo
    puts wait_to_start.colorize(:light_white).blink
  end

  def scores(opts, hide)
    system 'clear'
    puts logo
    puts "Cash: #{opts[:player].cash}$".rjust(LINE_LENGTH).colorize(:red)
    # puts '='.colorize(:light_white) * LINE_LENGTH

    scores!(opts, hide)
  end

  def error(error)
    puts "error: #{error}".colorize(:red)
    sleep 1
  end

  def scores!(opts, hide)
    dname = "#{opts[:dealer].name}: ".colorize(:yellow)
    if hide
      puts "#{dname}???".colorize(:yellow)
      puts opts[:dealer].hide_cards.colorize(:yellow)
    else
      puts "#{dname} #{opts[:dealer].score}".colorize(:yellow)
      puts opts[:dealer].display_cards.colorize(:yellow)
    end

    puts "#{opts[:player].name}: #{opts[:player].score}".colorize(:green)
    puts opts[:player].display_cards.colorize(:green)
  end

  def winner(player)
    puts player ? "Winner #{player.name}!".colorize(:green) : 'Draw...'.colorize(:green)
  end
end
