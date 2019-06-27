class ChangeDefaultCapacityToEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :capacity, :integer, null: false, default: 1
  end
end
