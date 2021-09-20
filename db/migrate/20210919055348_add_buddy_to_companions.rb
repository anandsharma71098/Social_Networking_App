class AddBuddyToCompanions < ActiveRecord::Migration[6.1]
  def change
    add_column :companions, :buddy, :integer
  end
end
