class Transfer
  
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount = 50)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end
  
  def valid?
    if @sender.status == @receiver.status
      true
    else false
    end
    @sender.valid?
    @receiver.valid?
  end
  
  def execute_transaction
    if @sender.valid? != true
    @status = "Transaction rejected. Please check your account balance."
    elsif @status == "pending"
    @sender.balance = @sender.balance - @amount
    @receiver.balance = @receiver.balance + @amount
    @status = "complete"
  else @status == "complete"
    @status = "complete"
  end
end
  
  
  
end
