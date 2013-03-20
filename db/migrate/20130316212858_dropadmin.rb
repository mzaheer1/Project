class Dropadmin < ActiveRecord::Migration
  def up
  	remove_column :Users, :admin
  end

  def down

  end
end
