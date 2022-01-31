require_relative 'account'
class Account_Statement 
  attr_reader :account
  def initialize(account = Account.new)
    @account = account
  end
end
