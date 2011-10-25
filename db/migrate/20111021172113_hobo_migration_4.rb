class HoboMigration4 < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :commentable_id
      t.string   :commentable_type
    end
    add_index :comments, [:commentable_type, :commentable_id]
  end

  def self.down
    drop_table :comments
  end
end
