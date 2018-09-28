class Inputs
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

  def user_choice
    # TODO: hint on take
    puts
    print "choice... hint or bet"
    gets
  end
end
