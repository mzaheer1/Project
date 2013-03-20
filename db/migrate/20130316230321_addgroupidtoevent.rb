class Addgroupidtoevent < ActiveRecord::Migration
  def up
  	add_column :events, :group_id, :integer
  end

  def down
  end
end
