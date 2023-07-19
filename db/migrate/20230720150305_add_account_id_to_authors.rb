class AddAccountIdToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :account_id, :integer
    add_index :authors, :account_id
  end
end
