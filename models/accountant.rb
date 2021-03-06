class Accountant
  BET_SIZE = 10

  def init_bet(player, dealer)
    bet(player) + bet(dealer)
  end

  def bet(player)
    validate_cash!(player)
    player.get_money(BET_SIZE)
  end

  def take_bet(player, value)
    player.give_money(value)
  end

  def money_back(bank, player, dealer)
    cash = bank / 2
    take_bet(player, cash)
    take_bet(dealer, cash)
  end

  private

  def validate_cash!(player)
    raise BetError, 'sorry, you have no money...' unless player.cash.positive?
  end
end

class BetError < RuntimeError
end
