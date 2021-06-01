class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  # your code here
  def initialize (sender,receiver, amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status="pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.valid? && sender.balance>amount && self.status=="pending"
      sender.balance-=amount
      receiver.deposit(amount)
      self.status="complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status="rejected"
    "Transaction rejected. Please check your account balance."
  end

end
