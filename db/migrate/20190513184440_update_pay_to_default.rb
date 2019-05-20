class UpdatePayToDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :jobs, :pay, :integer, default: 0, null: false
  end
end
