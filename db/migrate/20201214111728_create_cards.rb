class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :uid
      t.string :text
      t.string :gif
      t.string :share

      t.timestamps
    end
  end
end
