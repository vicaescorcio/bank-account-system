class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :tr_type
      t.date :tr_date
      t.float :valor


      t.references :account_from
      t.references :account_to
      t.references :user,  oreign_key: true
      t.timestamps
    end
  end
end
