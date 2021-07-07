class Transfer
 attr_accessor :status, :sender, :receiver, :amount 
 
 def initialize(status = "pending", sender, receiver, amount)
   @sender = sender 
   @receiver = receiver 
   @status = status 
   @amount = amount 
 end 
 
 def valid? 
   @sender.valid? && @receiver.valid? ? true : false 
 end 
 
 def execute_transaction
   if @sender.balance > @amount && @status == "pending" 
  # 1. sender's balance has to be greater than what is sent & have a pending status 
  # remember double ==
    @sender.balance -= amount 
  # 2. subtract senders amount from balance 
    @receiver.balance += amount 
  # 3. add amount to sender's account balance
    @status = "complete"
  # 4. change status to completed if 1-3 passed- both transactions went through
  else @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end 
end 

 
 def reverse_transfer
  if @status == "complete" 
    # congruent, cannot change its value 
    @sender.balance += amount 
    @receiver.balance -= amount 
    @status = "reversed"
   end 
 end 

end
