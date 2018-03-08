class ChangeFromDateTimeToDate < ActiveRecord::Migration[5.1]
  def change
    change_column :meals, :date, :date
  end
end
