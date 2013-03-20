class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :userid
      t.string :email
      t.boolean :admin
      t.string :password_digest

      t.timestamps
    end
  end
end
