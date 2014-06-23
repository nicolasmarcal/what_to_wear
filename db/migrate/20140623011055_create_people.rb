class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :image
      t.string :gender
      t.string :email
      t.string :uid
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :nick_name

      t.timestamps
    end
  end
end
