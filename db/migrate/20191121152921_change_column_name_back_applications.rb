class ChangeColumnNameBackApplications < ActiveRecord::Migration[6.0]
  def change
    rename_column :applications, :user_id, :applicant_id
  end
end
