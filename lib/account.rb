class Account
  attr_reader :balance, :credit, :debit, :transaction

  def initialize
    @balance = 0
    @transaction = []
  end

  def deposit(cash)
    @balance += cash
    @credit = cash
  end

  def withdraw(cash)
    raise 'You have insuffient funds' if insufficient_funds?(cash)
    @balance -= cash
    @debit = cash
  end

  private
  def insufficient_funds?(cash)
    @balance < cash
  end
end
