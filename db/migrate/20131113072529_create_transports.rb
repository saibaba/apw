class CreateTransports < ActiveRecord::Migration
  def change
    create_table :transports do |t|
      t.string :name
      t.decimal :share

      t.timestamps
    end
  end
end
