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
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if @sender.balance < @amount
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
    elsif @status == "pending"
    @sender.balance = @sender.balance - @amount
    @receiver.balance = @receiver.balance + @amount
    @status = "complete"
  else @status == "complete"
    @status = "complete"
  end
end


  def reverse_transfer
    if @status = "complete" && @receiver.balance != @sender.balance
    @receiver.balance = @receiver.balance - @amount
    @sender.balance = @sender.balance + @amount
    @receiver.balance == @sender.balance
    @status = "reversed"
  else @status = "reversed"
    @status = "reversed"
  end
  end
  
end
