class ChangeIdToUserId < ActiveRecord::Migration[7.0]
  def change
    rename_column :visits, :id_id, :user_id
  end
end
