class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :itinerary, foreign_key: true
      t.string :title
      t.string :date
      t.string :start_time
      t.string :end_time
      t.string :supplement

      t.timestamps
    end
  end
end
