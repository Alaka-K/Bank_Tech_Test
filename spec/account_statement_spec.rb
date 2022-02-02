require 'account_statement'

describe AccountStatement do
  it 'initialize with an account' do
    account = double(:double)
    statement = AccountStatement.new(account)
    expect(statement.account).not_to be_nil
  end

  it 'prints transactions in order of most recent transaction' do
    transactions = ["01/02/2022 || 30 || || 30", "01/02/2022 || || 5 || 25"]
    account = double :account, transactions: transactions.each{ |transaction| puts transaction }
    statement = AccountStatement.new(account)
    
    expect { statement.print_statement}.to output("date || credit || debit || balance\n01/02/2022 || || 5 || 25\n01/02/2022 || 30 || || 30\n").to_stdout
  end
end
