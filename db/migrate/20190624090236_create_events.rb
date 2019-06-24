class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.string :category
      t.string :tag
      t.datetime :event_at
      t.text :location
      t.integer :price
      t.integer :capacity
      t.string :event_image

      t.timestamps
    end
  end
end
