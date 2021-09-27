class Oystercard
  
  MAXIMUM_BALANCE = 90

  attr_reader :balance, :status

  def initialize 
    @balance = 0
    @status = status
  end

  def top_up(amount)
    raise "Maximum limit of #{MAXIMUM_BALANCE} exceeded" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare_value)
    @balance -= fare_value
  end

  def touch_in
    @status = true
  end

  def touch_out
    @status = false
  end

  def in_journey?
    status
  end
end