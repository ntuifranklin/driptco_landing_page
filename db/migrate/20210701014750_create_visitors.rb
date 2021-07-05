class CreateVisitors < ActiveRecord::Migration[6.1]
  def change
    create_table :visitors do |t|
      t.string :email, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.timestamps
    end
  end
end
