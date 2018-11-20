class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.status = 'pending'
    self.amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
    if self.valid? && self.status == "pending" && self.sender.balance >= self.amount
      self.sender.transfer(self.amount)
      self.receiver.deposit(self.amount)
      self.status = 'complete'
    else
      self.status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      self.receiver.transfer(self.amount)
      self.sender.deposit(self.amount)
      self.status = 'reversed'
    end
  end
end
