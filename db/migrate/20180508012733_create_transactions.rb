class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :from
      t.string :to
      t.float :amount
      t.integer :wallet_id 
      t.timestamps
    end
  end
end
