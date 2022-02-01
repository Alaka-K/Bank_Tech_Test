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
    it { is_expected.to respond_to(:deposit).with(2).argument }

    it 'changes balance' do
      account.deposit(10)
      expect(account.balance).to eq(10)
    end

    it 'raises error if depositing negative amount' do
      expect { account.deposit(-2) }.to raise_error 'Cannot deposit negitave amount'
    end

    it 'updates transactions' do
      date = Time.now.strftime("%d/%m/%Y")
      account.deposit(10, date)
      expect(account.transactions).to eq(["#{date} || #{account.credit} || || #{account.balance}"])
    end

    it 'updates transactions despite not manually inputting time' do
      account.deposit(10)
      expect(account.transactions).to eq(["#{Time.now.strftime("%d/%m/%Y")} || #{account.credit} || || #{account.balance}"])
    end
  end

  describe '.withdraw' do
    it { is_expected.to respond_to(:withdraw).with(2).argument }

    it 'changes balance' do
      account.deposit(30)
      account.withdraw(9)
      expect(account.balance).to eq(21)
    end

    it 'raises error if insufficent funds' do
      expect { account.withdraw(2) }.to raise_error 'You have insuffient funds'
    end

    it 'updates transactions' do
      date = Time.now.strftime("%d/%m/%Y")
      account.deposit(20, date)
      expect(account.transactions).to include("#{date} || #{account.credit} || || #{account.balance}")
      account.withdraw(10, date)
      expect(account.transactions).to include("#{date} || || #{account.debit} || #{account.balance}")
    end

    it 'updates transactions despite not manually inputting time' do
      account.deposit(20)
      expect(account.transactions).to eq(["#{Time.now.strftime("%d/%m/%Y")} || #{account.credit} || || #{account.balance}"])
      account.withdraw(10)
      expect(account.transactions).to include("#{Time.now.strftime("%d/%m/%Y")} || || #{account.debit} || #{account.balance}")
    end
  end
end
