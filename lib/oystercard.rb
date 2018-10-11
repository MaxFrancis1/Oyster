class Oystercard
  
  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1
  
  attr_reader :balance, :MAXIMUM_BALANCE, :in_journey, :entry_station, :exit_station
  
  def initialize
    @balance = 0
    @in_journey = false
  end
  
  def top_up(amount)
    fail 'Maximum balance exceeded' if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end
  
  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    !!entry_station
  end
  
  def touch_in(station)
    @entry_station = station
    fail "Insufficient balance to touch in" if balance < 1
    @in_journey = true
  end
  
  def touch_out(exit_station)
    @exit_station = exit_station
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
  end
  
end
