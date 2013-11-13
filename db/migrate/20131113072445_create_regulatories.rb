class CreateRegulatories < ActiveRecord::Migration
  def change
    create_table :regulatories do |t|
      t.string :name
      t.decimal :share

      t.timestamps
    end
  end
end
