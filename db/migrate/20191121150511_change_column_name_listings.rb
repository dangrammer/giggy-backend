class ChangeColumnNameListings < ActiveRecord::Migration[6.0]
  def change
    change_column :listings, :zip_code, :string
  end
end
