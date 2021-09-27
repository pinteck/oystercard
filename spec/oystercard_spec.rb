require 'oystercard'

describe Oystercard do

  describe '#balance' do
    it 'has an initial balance' do
      expect(subject.balance).to eq 0 
    end

    it 'adds money to the card' do
      expect { subject.top_up 1 } .to change { subject.balance }.by 1
    end

    it 'deducts the fare value from the balance' do
      expect {subject.deduct 1 } .to change { subject.balance }.by -1
    end
  end
  
  context 'when the card is full' do
    before do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
    end

    it 'raises and error if the new balance would exceed the limit' do
      max_balance = Oystercard::MAXIMUM_BALANCE
      expect{subject.top_up 1 }.to raise_error "Maximum limit of #{max_balance} exceeded"
    end

    it 'start with not being in journey' do
      expect(subject).not_to be_in_journey 
    end

    it 'changes the status to be in journey after touching in' do
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'changes the status not to be in journey after touching out' do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

  context 'when the card is empty' do
    before do
      subject.balance < Oystercard::MINIMUM_BALANCE
    end 
    it 'raises and error before touch_in, if there is no enough balance' do
      expect{subject.touch_in}.to raise_error 'Not enough balance' 
    end
  end


end