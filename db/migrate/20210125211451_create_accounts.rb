class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.float :balance
      t.string :acc_type

      t.timestamps
    end
  end
end
