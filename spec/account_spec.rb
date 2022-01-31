require 'account'

describe Account do
  subject(:account) { described_class.new }

  it 'initilaze with a balance of 0' do
    expect(account.balance).to eq(0)
  end

  it 'responds to deposit with an argument' do
    expect(account).to respond_to(:deposit).with(1).argument
  end

  it 'adds the deposit to the balance' do
    account.deposit(10)
    expect(account.balance).to eq(10)
  end
end
