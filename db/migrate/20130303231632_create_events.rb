class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :eventName
      t.string :venue
      t.datetime :time

      t.timestamps
    end
  end
end
