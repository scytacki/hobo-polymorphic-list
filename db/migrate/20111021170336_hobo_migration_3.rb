class HoboMigration3 < ActiveRecord::Migration
  def self.up
    add_column :page_elements, :name, :string
  end

  def self.down
    remove_column :page_elements, :name
  end
end
