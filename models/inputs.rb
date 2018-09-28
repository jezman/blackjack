class Inputs
  TURNS = %w[p pass a add o open].freeze

  def wait_to_enter
    begin
      system('stty raw -echo')
      str = STDIN.getc
    ensure
      system('stty -raw echo')
    end
    str != "\e"
  end

  def username
    system('clear')

    print 'Player name: '
    gets.chomp
  end

  def player_turn
    puts
    print 'Your turn: [p]ass, [a]dd, [o]pen: '
    choice = gets.chomp
    validate!(choice) ? choice : false
  end

  private

  def validate!(answer)
    raise AnwerError, 'wrong answer' unless TURNS.include?(answer)
  end
end

class AnwerError < RuntimeError
end
