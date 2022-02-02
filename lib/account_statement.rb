require_relative 'account'
class AccountStatement
  attr_reader :account

  def initialize(account = Account.new)
    @account = account
  end

  def credit
    @account.credit
  end

  def debit
    @account.debit
  end

  def print_statement
    p 'date || credit || debit || balance'
    @account.transactions.reverse.each { |transaction| p transaction }
  end
end
