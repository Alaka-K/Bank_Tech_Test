require 'account_statement'

describe AccountStatement do
  it 'initialize with an account' do
    account = double(:double)
    statement = AccountStatement.new(account)
    expect(statement.account).not_to be_nil
  end

  # it 'prints transactions' do
  #   transactions = ["01/02/2022 || 30 || || 30", "01/02/2022 || || 5 || 25"]
  #   account = double :account, transactions: transactions.each{ |transaction| p transaction }
  #   statement = AccountStatement.new(account)
  #   expect(statement.print_statement).to include("date || credit || debit || balance")
  #   expect(statement.print_statement).to include("01/02/2022 || 30 || || 30")
  #   expect(statement.print_statement).to include("01/02/2022 || || 5 || 25")
  # end
end
