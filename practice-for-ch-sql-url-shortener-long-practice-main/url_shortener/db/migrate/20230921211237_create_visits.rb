class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.string :short_url, null: false
      t.references :id, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
    add_index :visits, :short_url 
    add_index :visits, :id
  end
end
