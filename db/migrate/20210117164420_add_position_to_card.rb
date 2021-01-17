class AddPositionToCard < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :top, :float
    add_column :cards, :left, :float
    add_column :cards, :width, :float
    add_column :cards, :height, :float
    add_column :cards, :select, :boolean
  end
end
