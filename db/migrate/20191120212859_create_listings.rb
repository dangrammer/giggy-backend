class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :subject
      t.text :description
      t.string :date
      t.string :end_date
      t.string :city
      t.string :state
      t.integer :zip_code
      t.boolean :paying
      t.bigint :user_id
      t.bigint :category_id

      t.timestamps
    end
  end
end
