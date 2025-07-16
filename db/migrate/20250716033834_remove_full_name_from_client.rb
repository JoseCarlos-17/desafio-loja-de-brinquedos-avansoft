class RemoveFullNameFromClient < ActiveRecord::Migration[7.1]
  def change
    remove_column :clients, :full_name, :string
  end
end
