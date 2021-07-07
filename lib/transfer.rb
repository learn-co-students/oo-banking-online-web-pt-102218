class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end 
    
  def valid?
    if @sender.valid? == true and @receiver.valid? == true
      true 
    else 
      false 
    end 
  end
  
  
  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      "Transaction was already executed."
    else
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
    end
  end
  
  
  def reverse_transfer
    if self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
    
end
