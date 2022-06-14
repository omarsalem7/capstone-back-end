class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :size
      t.string :location
      t.decimal :price
      t.string :image

      t.timestamps
    end
  end
end
