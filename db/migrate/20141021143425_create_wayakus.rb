class CreateWayakus < ActiveRecord::Migration
  def change
    create_table :wayakus do |t|
      t.string :post_id
      t.integer :post_type
      t.integer :selected_category
      t.string :questionBody
      t.string :answer_of_user

      t.timestamps
    end
  end
end
