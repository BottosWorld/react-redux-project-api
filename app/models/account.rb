class Account < ApplicationRecord
    has_many :transactions

    def update_balance(transaction)
        if transaction.t_type == 'deposit' || 'credit'
            self.balance = self.balance + transaction.t_amount
            self.save
        elsif transaction.t_type == 'debit' || 'withdrawal'
            if self.balance >= transaction.t_amount
                self.balance = self.balance - transaction.t_amount
                self.save
            else
                return 'Balance too low.. =('
            end
        end
    end


end
