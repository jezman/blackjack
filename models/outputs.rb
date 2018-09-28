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

  def scores(player, dealer, bank)
    system 'clear'
    puts logo
    puts "At stake: #{bank}$".rjust(LINE_LENGTH)
    puts '=' * LINE_LENGTH
    puts "#{dealer.name}: #{dealer.display_cards}"
    puts "#{player.name}: #{player.display_cards}| Score: #{player.score} | Cash: #{player.cash}$"
  end
end
