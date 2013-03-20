class UpdateMembershipColumns < ActiveRecord::Migration
  def up
  	rename_column :memberships, :userid, :user_id
  	rename_column :memberships, :groupid, :group_id
  end

  def down
  end
end
