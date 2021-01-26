class Transaction < ApplicationRecord
    belongs_to :account
    validates :t_amount, presence: true
    validates_inclusion_of :t_type, :in => ['credit', 'withdrawal', 'charge', 'deposit']

end
