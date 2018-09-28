class Outputs
  def welcome
    'Welcome to the Blackjack game'.center(80)
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
    'Press Enter to start a new game or ESC to quit...'.center(80)
  end

  def splash_screen
    system 'clear'
    print welcome
    puts logo
    puts wait_to_start
  end

  def scores(player, dealer, bank)
    splash_screen

    puts "Cash: #{player.cash}$ At stake: #{bank}$"
    puts
    puts "#{dealer.name}: #{dealer.display_cards}"
    puts "#{player.name}: #{player.display_cards}"
    puts
    puts "Score: #{player.score}"
  end
end
