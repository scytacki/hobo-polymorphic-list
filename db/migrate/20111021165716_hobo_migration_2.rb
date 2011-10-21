class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :page_elements, :page_id, :integer

    add_index :page_elements, [:page_id]
  end

  def self.down
    remove_column :page_elements, :page_id

    remove_index :page_elements, :name => :index_page_elements_on_page_id rescue ActiveRecord::StatementInvalid
  end
end
