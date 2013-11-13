class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.decimal :share

      t.timestamps
    end
  end
end
