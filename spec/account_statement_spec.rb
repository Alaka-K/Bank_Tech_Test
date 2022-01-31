require 'account_statement'

describe Account_Statement do
  
  it 'initialize with an account' do
    account = double(:double)
    statement = Account_Statement.new(account)
    expect(statement.account).not_to be_nil
  end

  it 'shows how much you have deposited' do
    account = double :account, credit: 5
    statement = Account_Statement.new(account)
    expect(statement.credit).to eq(5)
  end

  it 'shows how much you have withdrawn' do
    account = double :account, debit: 5
    statement = Account_Statement.new(account)
    expect(statement.debit).to eq(5)
  end
end
