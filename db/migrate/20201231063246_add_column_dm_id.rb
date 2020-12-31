class AddColumnDmId < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :DM_id, :string
  end
end
