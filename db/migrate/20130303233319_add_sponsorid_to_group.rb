class AddSponsoridToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :sponsorid, :integer
  end
end
