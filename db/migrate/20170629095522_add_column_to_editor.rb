class AddColumnToEditor < ActiveRecord::Migration[5.0]
  def change
    add_column :editors, :tex, :string
  end
end
