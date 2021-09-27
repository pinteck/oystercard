class Oystercard
  
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1 

  attr_reader :balance, :in_journey

  def initialize 
    @balance = 0
    @in_journey = in_journey
  end

  def top_up(amount)
    raise "Maximum limit of #{MAXIMUM_BALANCE} exceeded" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare_value)
    @balance -= fare_value
  end

  def touch_in
    raise "Not enough balance" if balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    in_journey
  end
end