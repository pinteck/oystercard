require 'oystercard'

describe Oystercard do

  describe '#balance' do
    it 'has an initial balance' do
      expect(subject.balance).to eq 0 
    end

    # it 'had a maximum limit' do
    #   expect(subject.balance).to be <= 90
    # end
  end


  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'adds money to the card' do
      expect { subject.top_up 1 } .to change { subject.balance }.by 1
    end

    it 'raises and error if the new balance would exceed the limit' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      expect{subject.top_up 1 }.to raise_error 'Maximum limit is £90'
    end
  end

end