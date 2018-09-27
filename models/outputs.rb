class Ouputs
  def splash_screen
    system 'clear'
    puts %q(
                         Welcome to the Blackjack game

    .------..------..------..------..------..------..------..------..------.
    |B.--. ||L.--. ||A.--. ||C.--. ||K.--. ||J.--. ||A.--. ||C.--. ||K.--. |
    | :(): || :/\: || (\/) || :/\: || :/\: || :(): || (\/) || :/\: || :/\: |
    | ()() || (__) || :\/: || :\/: || :\/: || ()() || :\/: || :\/: || :\/: |
    | '--'B|| '--'L|| '--'A|| '--'C|| '--'K|| '--'J|| '--'A|| '--'C|| '--'K|
    `------'`------'`------'`------'`------'`------'`------'`------'`------'

                Press Enter to start a new game or ESC to quit...
    ).freeze
  end

  def main_interface(player, dealer)
    system 'clear'
    puts "#{dealer.name}: #{dealer.cards_to_s}"
    puts "#{player.name}: #{player.cards_to_s}"
    puts
    puts "Points: #{player.points}"
    puts "Cash: #{player.cash_to_s}"
  end
end
