class AddDataToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :data, :string
  end
end
