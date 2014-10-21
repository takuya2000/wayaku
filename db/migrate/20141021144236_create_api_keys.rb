class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token
      t.string :user_name
      t.string :uuid
      t.string :invitation_code

      t.timestamps
    end
  end
end
