class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :api_event_id
      t.string :title
      t.string :image_url
      t.integer :api_venue_id
      t.string :venue_name
      t.string :city_name
      t.string :country_name
      t.string :category
      t.string :tickets_url
      t.string :state_prov
      t.string :avg_price
      t.string :datetime_local

      t.timestamps null: false
    end
  end
end
