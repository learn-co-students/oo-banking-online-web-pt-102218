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
    sender.valid? && receiver.valid?
  end

  def execute_transaction
      if valid?
        @sender.balance -= @amount
        @receiver.balance += @amount
        @amount = 0
        @status = "complete"
      elsif @sender.valid? == false
        @status = "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer 
    end


end
