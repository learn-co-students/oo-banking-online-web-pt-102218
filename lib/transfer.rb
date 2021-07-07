class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender,receiver,amt)
    @sender=sender
    @receiver=receiver
    @status='pending'
    @amount=amt
  end

  def valid?
    @receiver.valid? && @sender.valid?
  end

  def execute_transaction
    if @status == 'pending'
      if @sender.balance > @amount
        @sender.balance-=@amount
        @receiver.balance+=@amount
        @status ='complete'
      else
        @status ='rejected'
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance+=@amount
      @receiver.balance-=@amount
      @status="reversed"
    end
  end


end
