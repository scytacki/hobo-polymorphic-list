class HoboMigration6 < ActiveRecord::Migration
  def self.up
    add_column :page_elements, :position, :integer
  end

  def self.down
    remove_column :page_elements, :position
  end
end
