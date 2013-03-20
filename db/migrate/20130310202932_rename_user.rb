class RenameUser < ActiveRecord::Migration
  def up
	 rename_column :Users, :username, :name
  end

  def down
  end
end
