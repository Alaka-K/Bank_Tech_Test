class Account
  attr_reader :balance, :credit, :debit, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(cash, date = Time.now.strftime("%d/%m/%Y"))
    date = date.to_s
    @balance += cash
    @credit = cash
    @transactions.push("#{date} || #{@credit} || || #{@balance}")
  end

  def withdraw(cash, date = Time.now.strftime("%d/%m/%Y"))
    date = date.to_s
    raise 'You have insuffient funds' if insufficient_funds?(cash)
    @balance -= cash
    @debit = cash
    @transactions.push("#{date} || || #{@debit} || #{@balance}")
    
  end

  private
  def insufficient_funds?(cash)
    @balance < cash
  end
end
