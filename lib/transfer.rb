class Transfer

  attr_accessor :receiver, :sender, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @amount = amount
  end

  def valid?
    receiver.valid? && sender.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else

      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount  && self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"

    else
      self.status = "rejected"
    end

  end
end
