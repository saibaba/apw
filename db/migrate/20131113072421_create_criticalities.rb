class CreateCriticalities < ActiveRecord::Migration
  def change
    create_table :criticalities do |t|
      t.string :name
      t.decimal :share

      t.timestamps
    end
  end
end
