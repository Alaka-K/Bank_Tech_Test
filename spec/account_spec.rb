require 'account'

describe Account do
  subject(:account) { described_class.new }

  it 'initilaze with a balance of 0' do
    expect(account.balance).to eq(0)
  end

  describe '.deposit' do
    it 'takes an argument' do
      expect(account).to respond_to(:deposit).with(1).argument
    end

    it 'changes balance' do
      account.deposit(10)
      expect(account.balance).to eq(10)
    end
  end

  describe '.withdraw' do
    it 'takes an argument' do
      expect(account).to respond_to(:withdraw).with(1).argument
    end

    it 'changes balance' do
      account.deposit(30)
      account.withdraw(9)
      expect(account.balance).to eq(21)
    end
  end

end
