class HoboMigration5 < ActiveRecord::Migration
  def self.up
    add_column :page_elements, :insertable_id, :integer
    add_column :page_elements, :insertable_type, :string

    add_index :page_elements, [:insertable_type, :insertable_id]
  end

  def self.down
    remove_column :page_elements, :insertable_id
    remove_column :page_elements, :insertable_type

    remove_index :page_elements, :name => :index_page_elements_on_insertable_type_and_insertable_id rescue ActiveRecord::StatementInvalid
  end
end
