class Account < ApplicationRecord
    belongs_to :agency
    has_many :account_to_accounts, :class_name => 'Transaction', :foreign_key => 'account_to_id'
    has_many :account_from_accounts, :class_name => 'Transaction', :foreign_key => 'account_from_id'

    validates :cc, :limit, presence: true
    def cred(valor)
       limit = self.limit + valor
       self.update(limit:limit)
    end

    def deb(valor)
        limit = self.limit - valor
        self.update(limit:limit)
    end
    def agency
        agency = Agency.find_by(id:self.agency_id)
    end
end     