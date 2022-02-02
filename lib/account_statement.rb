require_relative 'account'
class AccountStatement
  attr_reader :account

  def initialize(account = Account.new)
    @account = account
  end


  def print_statement
    puts 'date || credit || debit || balance'
    @account.transactions.reverse.each { |transaction| puts transaction }
  end
end
