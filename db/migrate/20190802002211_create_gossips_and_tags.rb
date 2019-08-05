class CreateGossipsAndTags < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.string :title
      t.text :content
      t.belongs_to :user
      t.timestamps
    end

    create_table :tags do |t|
      t.string :title
      t.timestamps
    end

    create_table :gossips_tags do |t|
      t.belongs_to :gossip, index: true
      t.belongs_to :tag, index: true
    end

  end
end
