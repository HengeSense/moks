class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :county
      t.string :country
      t.string :postcode
      t.string :map_url
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
