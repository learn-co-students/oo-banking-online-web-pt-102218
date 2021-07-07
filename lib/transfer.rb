require 'pry'
class Transfer 
  
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, number)
    @sender = sender 
    @receiver = receiver 
    @number = number 
    @status = "pending"
    @amount = 50
  end 
  
  def valid?
   if @sender.valid? && @receiver.valid?
     true 
   end 
end 

  def execute_transaction 
    if self.valid? && @sender.balance > @number && self.status == "pending"
       @sender.balance -= @number 
       @receiver.balance += @number
         self.status = "complete" 
    else
      self.status = "rejected" 
      "Transaction rejected. Please check your account balance."
    end 
 
 end 
 
 def reverse_transfer 
    if self.status == "complete"
      @sender.balance += @number 
        @receiver.balance -= @number 
           self.status = "reversed"
    end
  end 
end 





