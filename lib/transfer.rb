class Transfer
  
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @amount = 50
  end
  
  def valid?
    if @sender.status == @receiver.status
      true
    else false
    end
  end
  
  def execute_transaction
    counter = 0
    @sender.balance = @sender.balance - @amount
    @receiver.balance = @receiver.balance + @amount
    while counter < 0
     counter +=1
  end
  @status = "complete"
end
  
  
  
end
