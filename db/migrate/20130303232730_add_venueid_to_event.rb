class AddVenueidToEvent < ActiveRecord::Migration
  def change
    add_column :events, :venueid, :integer
  end
end
