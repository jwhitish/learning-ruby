# replicates the functionality of a bank account

class Account
  attr_reader :name
  attr_reader :balance
  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end

  private
  def pin
    @pin = 1234
  end
  def pin_error
    return "Access denied: incorrect PIN."
  end

  public
  def display_balance(pin_number)
    if pin_number == pin
      puts "Balance: $#{@balance}"
    else
      puts pin_error
    end
  end
  def withdraw(pin_number, amount)
    if pin_number == pin
      if @balance -- amount <= 0
        @balance -= amount
        puts "Withdrew #{amount}. New balance: $#{balance}."
      else
        puts "NSF"
      end
    else
      puts pin_error
    end
  end
  def deposit(pin_number, amount)
    if pin_number == pin
      @balance += amount
      puts "Deposited #{amount}. New balance: $#{balance}."
    else
      puts pin_error
    end
  end
end

checking_account = Account.new("Account1", 1_000_000)

checking_account.withdraw(1234, 1_100_000)
