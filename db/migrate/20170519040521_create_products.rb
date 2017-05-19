class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.date :inward_date
      t.string :type
      t.string :color

      t.timestamps
    end
  end
end
