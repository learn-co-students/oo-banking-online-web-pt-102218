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
    if @sender.status[3] == @receiver.status[3]
      true
    else false
    end
  end
  
end
