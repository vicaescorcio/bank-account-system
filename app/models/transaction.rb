class Transaction < ApplicationRecord
    belongs_to :user
    belongs_to :account_to, :class_name => 'Account', optional: true 
    belongs_to :account_from, :class_name => 'Account', optional: true 
    enum tr_type: { saque: 0, transferencia: 1, estorno:2, deposito:3  }
    validate :check_limit

  def updateValues
    account_from = Account.find_by(id:self.account_from_id)
    account_to = Account.find_by(id:self.account_to_id)
    if self.tr_type ==1
        account_from.deb(self.valor)
        account_to.cred(self.valor)
    elsif self.tr_type == 0
        account_from.deb(self.valor)
    else
        account_to.cred(self.valor)
    end
       
  end
    
  private
  def check_limit
    account_from = Account.find_by(id:self.account_from_id)
    limit = 0
    if(!account_from.nil? and [0,1].include?(self.tr_type))
      limit = account_from.limit - self.valor
    end
    if limit < 0
      errors.add(:valor, " O valor da transação é maior" )
    end
  end
end
