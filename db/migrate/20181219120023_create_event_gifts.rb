class CreateEventGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :event_gifts do |t|
      t.string :title
      t.string :price

      t.timestamps
    end
  end
end
