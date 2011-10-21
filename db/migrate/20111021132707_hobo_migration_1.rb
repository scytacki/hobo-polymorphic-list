class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :image_elements do |t|
      t.string   :url
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :page_elements do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :pages do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :text_elements do |t|
      t.text     :content
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :image_elements
    drop_table :page_elements
    drop_table :pages
    drop_table :text_elements
  end
end
