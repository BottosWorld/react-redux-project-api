class Account < ApplicationRecord
    has_many :transactions

    def update_balance(transaction)
        if transaction.t_type == 'deposit' || transaction.t_type == 'credit'
            self.balance = self.balance + transaction.t_amount
            self.save
        elsif transaction.t_type == 'debit' || transaction.t_type == 'withdrawal'
            if self.balance >= transaction.t_amount
                self.balance = self.balance - transaction.t_amount
                self.save
            else
                return 'Balance too low.. =('
            end
        end
    end

    def update_delete_balance(transaction)
        if transaction.t_type == 'deposit' || transaction.t_type == 'credit'
            self.balance = self.balance - transaction.t_amount
            self.save
        elsif transaction.t_type == 'debit' || transaction.t_type == 'withdrawal'
            if self.balance >= transaction.t_amount
                self.balance = self.balance + transaction.t_amount
                self.save
            else
                return 'Balance too low.. =('
            end
        end
    end

end
