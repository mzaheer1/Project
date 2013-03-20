class RenameUserName < ActiveRecord::Migration
  def self.up
	 rename_column :events, :eventName, :name
  end


  def self.down
  end
end
