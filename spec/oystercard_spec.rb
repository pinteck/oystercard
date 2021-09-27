require 'oystercard'

describe Oystercard do

  describe '#balance' do
    it 'has an initial balance' do
      expect(subject.balance).to eq 0 
    end
  end


  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'adds money to the card' do
      expect { subject.top_up 1 } .to change { subject.balance }.by 1
    end

    it 'raises and error if the new balance would exceed the limit' do
      max_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(max_balance)
      expect{subject.top_up 1 }.to raise_error "Maximum limit of #{max_balance} exceeded"
    end
  end

  describe '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts the fare value from the balance' do
      expect {subject.deduct 1 } .to change { subject.balance }.by -1
    end
  end

end