class CreateForecasts < ActiveRecord::Migration[7.1]
  def change
    create_table :forecasts do |t|
      t.references :location, foreign_key: true
      t.date :date
      t.integer :high_temp
      t.integer :low_temp

      t.timestamps
    end
  end
end
