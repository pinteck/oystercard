require 'oystercard'

describe Oystercard do
  it 'has an initial balance' do
    expect(subject.balance).to eq 0 
  end

  it 'adds money to the card' do
    my_oyster = Oystercard.new
    my_oyster.top_up(10)
    expect(my_oyster.balance).to eq 10
  end
end