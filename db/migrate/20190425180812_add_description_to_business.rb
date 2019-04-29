class AddDescriptionToBusiness < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :description, :string
  end
end
