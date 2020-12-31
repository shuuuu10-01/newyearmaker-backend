class CreateRecieves < ActiveRecord::Migration[6.0]
  def change
    create_table :recieves do |t|
      t.string :uid
      t.string :display_name
      t.string :public_uid

      t.timestamps
    end
  end
end
