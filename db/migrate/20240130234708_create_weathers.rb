class CreateWeathers < ActiveRecord::Migration[7.1]
  def change
    create_table :weathers do |t|
      t.integer :location_id
      t.float :termperature
      t.string :conditions

      t.timestamps
    end
  end
end
