class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.date :date
      t.integer :value
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
