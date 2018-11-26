class BankAccount

  attr_accessor :balance, :status
  attr_reader :name, :close_account

  def initialize(name)
    @name = name
    @balance = 1000
    @balance
    @status = "open"
  end

  def deposit(sum)
    @balance = 1000 + sum
    @balance
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.balance > 0 &&
    self.status == "open"
  end

  def close_account
    @status = "closed"
  end
end
