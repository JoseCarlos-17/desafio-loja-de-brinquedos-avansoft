class AddSomeColumnsToClient < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :full_name, :string
    add_column :clients, :birthdate, :date
  end
end
