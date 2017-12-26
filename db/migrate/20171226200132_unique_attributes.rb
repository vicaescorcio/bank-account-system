class UniqueAttributes < ActiveRecord::Migration[5.1]
  def change
    add_index :accounts, :cc, unique:true
    add_index  :agencies, :ag, unique:true
  end
end
