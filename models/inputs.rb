require 'colorize'

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

    print 'Player name: '.colorize(:light_white)
    gets.chomp
  end

  def player_turn
    puts
    print 'Your turn: [p]ass, [a]dd, [o]pen: '.colorize(:light_white)
    choice = gets.chomp
    validate!(choice)
    choice
  end

  def continue?
    print 'Continue game? (y/n) '.colorize(:light_white)
    gets.chomp == 'y'
  end

  private

  def validate!(choice)
    raise ChoiceError, 'wrong answer' unless TURNS.include?(choice)
  end
end

class ChoiceError < RuntimeError
end
