class ChangeColumnNameApplications < ActiveRecord::Migration[6.0]
  def change
    rename_column :applications, :applicant_id, :user_id
  end
end
