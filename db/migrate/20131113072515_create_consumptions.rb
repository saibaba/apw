class CreateConsumptions < ActiveRecord::Migration
  def change
    create_table :consumptions do |t|
      t.string :name
      t.decimal :share

      t.timestamps
    end
  end
end
