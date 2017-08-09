class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.integer :document_id
      t.string :name

      t.timestamps
    end
  end
end
