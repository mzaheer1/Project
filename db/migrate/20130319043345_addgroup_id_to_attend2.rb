class AddgroupIdToAttend2 < ActiveRecord::Migration
  def up
  	add_column :attends, :group_id, :integer
  end

  def down
  end
end
