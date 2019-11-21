class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :principal_role
      t.string :principal_instrument
      t.string :image_url
      t.text :bio
      t.text :credits
      t.string :website_url

      t.timestamps
    end
  end
end
