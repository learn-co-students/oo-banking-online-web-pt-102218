require 'pry'
class BankAccount
  
  attr_reader :name, :status
  attr_accessor :balance, :status

def initialize(name)
  @name = name 
  @balance = 1000
  @status = "open"
end 

def deposit(number)
  new_balance = @balance + number
  self.balance = new_balance 
  self.balance 
end 

def display_balance
  "Your balance is $#{self.balance}." 
end

def valid?
  if self.status == "open" && self.balance > 0 
    true
  else 
    false
  end 
end


def close_account
  self.status = "closed"
end 



end