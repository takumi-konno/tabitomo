class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :image
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
