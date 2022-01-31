require 'account_statement'

describe Account_Statement do
  
  it 'initialize with an account' do
    account = double(:account)
    statement = Account_Statement.new(account)
    expect(statement.account).not_to be_nil
  end
end
