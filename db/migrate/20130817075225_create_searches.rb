class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :title
      t.string :address
      t.integer :radius
      t.integer :user_id
      t.string :subject
      

      t.timestamps
    end
  end
end
