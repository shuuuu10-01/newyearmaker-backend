class AddColumnPublicUidandDisplayName < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :public_uid, :string
    add_index  :cards, :public_uid, unique: true

    add_column :cards, :display_name, :string
  end
end
