class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.bigint :cc
      t.float :limit
      
      t.references :agency,  foreign_key: true
      
      t.timestamps
    end
  end
end
