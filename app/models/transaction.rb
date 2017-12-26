class Transaction < ApplicationRecord
    belongs_to :user
    belongs_to :account_to, :class_name => 'Account'
    belongs_to :account_from, :class_name => 'Account', optional: true 
end
