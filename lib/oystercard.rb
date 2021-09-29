class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  STD_FARE_VALUE = 1

  attr_reader :balance, :in_journey, :entry_station, :journey, :journeys

  def initialize
    @balance = 0
    @in_journey = false
    @journeys = []
  end

  def top_up(amount)
    raise "Maximum limit of #{MAXIMUM_BALANCE} exceeded" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    @entry_station = station
    raise "Not enough balance" if balance < MINIMUM_BALANCE
    @in_journey = true
    # journey << @entry_station
  end

  def touch_out(station)
    @exit_station = station
    @in_journey = false
    deduct(STD_FARE_VALUE)
    # journey << @exit_station
    # @entry_station = nil
  end

  def save_journey
    journey = {}
    journey[@entry_station] = @exit_station
    journey
  end

  def in_journey?
    !!in_journey
  end

  private

  def deduct(value)
    @balance -= value
  end
end
