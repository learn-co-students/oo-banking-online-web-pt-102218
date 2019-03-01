class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    return unless ['pending', 'reversed', 'rejected'].include?(@status)

    if !valid? || @sender.balance < @amount
      @status = 'rejected'
      return 'Transaction rejected. Please check your account balance.'
    end

    @sender.deposit(-amount)
    @receiver.deposit(amount)
    @status = 'complete'
  end

  def reverse_transfer
    return unless ['complete', 'reverse-rejected'].include?(@status)

    if !valid? || @receiver.balance < @amount
      @status = 'reverse-rejected'
      'Transaction rejected. Please check the receiver account balance.'
    end

    @receiver.deposit(-amount)
    @sender.deposit(amount)
    @status = 'reversed'
  end
end
