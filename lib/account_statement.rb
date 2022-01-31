require_relative 'account'
class Account_Statement 
  attr_reader :account
  def initialize(account)
    @account = account
  end
end
