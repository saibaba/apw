class CreateYesnos < ActiveRecord::Migration
  def change
    create_table :yesnos do |t|
      t.string :name
      t.decimal :share

      t.timestamps
    end
  end
end
