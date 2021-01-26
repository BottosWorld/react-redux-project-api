class Transaction < ApplicationRecord
    belongs_to :account
    validates :t_amount, presence: true
end
