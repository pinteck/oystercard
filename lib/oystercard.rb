class Oystercard
  
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1 
  FARE_VALUE = 1

  attr_reader :balance, :in_journey, :fare_value

  def initialize 
    @balance = 0
    @in_journey = in_journey
  end

  def top_up(amount)
    raise "Maximum limit of #{MAXIMUM_BALANCE} exceeded" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    raise "Not enough balance" if balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct
  end

  def in_journey?
    in_journey
  end

  private 
  
  def deduct()
    @balance -= 1
  end
end