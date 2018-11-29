class Transfer
  # your code here
attr_accessor :transfer, :sender, :receiver, :status, :amount

  def initialize(transfer, sender, receiver)
   @sender = sender
   @receiver = receiver
   @transfer = transfer
   @status = "pending"
   @amount = 50
 end
 
end
