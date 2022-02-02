require 'account'

describe Account do
  subject(:account) { described_class.new }

  it 'initilaze with a balance of 0' do
    expect(account.balance).to eq(0)
  end

  it 'initilaze with an empty transaction' do
    expect(account.transactions).to eq([])
  end

  describe '.deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'changes balance' do
      account.deposit(10)
      expect(account.balance).to eq(10)
    end

    it 'raises error if depositing negative amount' do
      expect { account.deposit(-2) }.to raise_error 'Cannot deposit negitave amount'
    end

    it 'updates transactions' do
      date = Time.now.strftime('%d/%m/%Y')
      account.deposit(10)
      expect(account.transactions).to eq(["#{date} || 10.00 || || 10.00"])
    end

    it 'updates transactions despite not manually inputting time' do
      account.deposit(10)
      expect(account.transactions).to eq(["#{Time.now.strftime("%d/%m/%Y")} || 10.00 || || 10.00"])
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

    it 'updates transactions' do
      date = Time.now.strftime('%d/%m/%Y')
      account.deposit(20.34)
      expect(account.transactions).to include("#{date} || 20.34 || || 20.34")
      account.withdraw(10)
      expect(account.transactions).to include("#{date} || || 10.00 || 10.34")
    end

    it 'updates transactions despite not manually inputting time' do
      account.deposit(20)
      expect(account.transactions).to eq(["#{Time.now.strftime("%d/%m/%Y")} || 20.00 || || 20.00"])
      account.withdraw(5)
      expect(account.transactions).to include("#{Time.now.strftime("%d/%m/%Y")} || || 5.00 || 15.00")
    end
  end
end
