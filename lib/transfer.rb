class Transfer
  attr_accessor :transfer, :status, :amount
  attr_reader :sender, :receiver
  def initialize(sender, receiver, amount)
    @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid?
    self.receiver.valid?
  end

  def execute_transaction
    if self.sender.valid? && self.sender.balance >= self.amount && self.status = "pending"
      self.receiver.balance += self.amount
      self.sender.balance -= self.amount
      self.status = "complete"
      self.amount = 0
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.amount = 50
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"

    end
  end

end
