class Account
  attr_reader :balance, :credit, :debit, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(cash, date = Time.now.strftime('%d/%m/%Y'))
    date = date.to_s
    @credit = cash
    raise 'Cannot deposit negitave amount' if negitave_amount?(@credit)

    @balance += @credit
    @transactions.push("#{date} || #{format('%.2f', @credit)} || || #{format('%.2f', @balance)}")
  end

  def withdraw(cash, date = Time.now.strftime('%d/%m/%Y'))
    date = date.to_s
    @debit = cash
    raise 'You have insuffient funds' if insufficient_funds?(@debit)

    @balance -= @debit
    @transactions.push("#{date} || || #{format('%.2f', @debit)} || #{format('%.2f', @balance)}")
  end

  private

  def insufficient_funds?(cash)
    @balance < cash
  end

  def negitave_amount?(cash)
    cash.negative?
  end
end
