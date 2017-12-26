class CreateAgencies < ActiveRecord::Migration[5.1]
  def change
    create_table :agencies do |t|
      t.bigint :ag
      t.string :address

      t.timestamps
    end
  end
end
