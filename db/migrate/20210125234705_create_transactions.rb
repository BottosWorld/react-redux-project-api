class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|

      t.float :t_amount
      t.string :t_type
      t.string :description
      t.string :t_name

      t.timestamps
    end
  end
end
