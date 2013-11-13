class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :customer_id
      t.string :name
      t.integer :servers
      t.integer :tiers
      t.string :style
      t.string :provider
      t.string :customization
      t.string :consumer
      t.string :consumption
      t.string :transport
      t.string :integration
      t.string :inhouse
      t.string :contracted
      t.string :criticality
      t.string :sensitivity
      t.string :regulatory
      t.string :constraint

      t.timestamps
    end
  end
end
