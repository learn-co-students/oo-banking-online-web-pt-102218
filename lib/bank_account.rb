class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    self.balance = 1000
    self.status = 'open'
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.balance > 0 && self.status == 'open' ? true : false
  end

  def deposit(amount)
    self.balance += amount
  end

  def transfer(amount)
    self.balance -= amount
  end

  def close_account
    self.balance = 0
    self.status = 'closed'
  end
end
