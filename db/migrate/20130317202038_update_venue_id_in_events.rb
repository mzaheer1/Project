class UpdateVenueIdInEvents < ActiveRecord::Migration
  def up
  	rename_column :events, :venueid, :venue_id
  end

  def down
  end
end
