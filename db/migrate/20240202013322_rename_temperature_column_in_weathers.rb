class RenameTemperatureColumnInWeathers < ActiveRecord::Migration[7.1]
  def change
    rename_column :weathers, :termperature, :temperature
  end
end
