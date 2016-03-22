class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :postal_zip_code
      t.string :city
      t.string :country

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
