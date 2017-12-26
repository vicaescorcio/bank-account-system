class Account < ApplicationRecord
    belongs_to :agency
    has_many :account_to_accounts, :class_name => 'Transaction', :foreign_key => 'account_to_id'
    has_many :account_from_accounts, :class_name => 'Transaction', :foreign_key => 'account_from_id'
end
