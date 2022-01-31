require 'account'

describe Account do
  subject(:account) { described_class.new }

  it 'initilaze with a balance of 0' do
    expect(account.balance).to eq(0)
  end

  describe '.deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'changes balance' do
      account.deposit(10)
      expect(account.balance).to eq(10)
    end
  end

  describe '.withdraw' do
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it 'changes balance' do
      account.deposit(30)
      account.withdraw(9)
      expect(account.balance).to eq(21)
    end

    it 'raises error if insufficent funds' do
      expect { account.withdraw(2) }.to raise_error 'You have insuffient funds'
    end
  end

end
