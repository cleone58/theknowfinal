class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.integer :api_venue_id
      t.string :name
      t.string :timezone
      t.string :address
      t.string :city
      t.string :state_prov
      t.string :postal_zip_code
      t.string :country
      t.string :tickets_url
      t.float :latitude
      t.float :longitude
      t.string :extended_address

      t.timestamps null: false
    end
  end
end
