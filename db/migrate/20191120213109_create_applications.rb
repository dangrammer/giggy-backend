class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.bigint :applicant_id
      t.bigint :listing_id

      t.timestamps
    end
  end
end
