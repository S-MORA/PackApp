class AddCreditToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :credit, :integer, :default => 0
  end
end
