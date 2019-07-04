class RemoveEventImageFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :event_image, :string
  end
end
