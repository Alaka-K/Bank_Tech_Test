require 'account_statement'

describe Account_Statement do
  
  it 'initializes with an account' do
    statement = Account_Statement.new
    expect(statement.account).not_to be_nil
  end
end
