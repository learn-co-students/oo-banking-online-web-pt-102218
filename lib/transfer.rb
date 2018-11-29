require "pry"

class Transfer
  # your code here
attr_accessor  :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @status = "pending"
   @amount = 50
 end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if valid? == true
      @sender.balance -= @amount
      @receiver.balance += @amount
      @amount = 0
      @status = "complete"
    else
      @status = "Transaction rejected. Please check your account balance."
    end
  end

end
