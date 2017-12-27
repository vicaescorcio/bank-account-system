class Agency < ApplicationRecord
    has_many :accounts
    validates :ag, :address, presence: true
end
