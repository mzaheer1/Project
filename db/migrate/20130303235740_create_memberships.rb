class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :userid
      t.integer :groupid

      t.timestamps
    end
  end
end
