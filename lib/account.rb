class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(cash)
    @balance += cash
  end

  def withdraw(cash)
    raise 'You have insuffient funds' if insufficient_funds?(cash)
    @balance -= cash
  end

  private
  def insufficient_funds?(cash)
    @balance < cash
  end
end
