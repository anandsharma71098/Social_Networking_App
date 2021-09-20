class AddDummyToCompanions < ActiveRecord::Migration[6.1]
  def change
    add_column :companions, :dummy, :integer
  end
end
