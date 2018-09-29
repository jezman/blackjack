class Accountant
  BET_SIZE = 10

  def init_bet(player, dealer)
    bet(player) + bet(dealer)
  end

  def bet(player)
    validate_cash!(player)
    player.cash -= BET_SIZE
    BET_SIZE
  end

  def take_bet(player, value)
    player.cash += value
  end

  def money_back(bank, player, dealer)
    cash = bank / 2
    take_bet(player, cash)
    take_bet(dealer, cash)
  end

  private

  def validate_cash!(player)
    raise BetError, 'sorry, you have no money...' unless positive?(player.cash)
  end

  def positive?(cash)
    cash > 0
  end
end
