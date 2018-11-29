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
    if valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @sender.balance
      @receiver.balance
      @status = "complete"
    else
      "Transaction rejected. Please check your account balance."
    end
  end

end
