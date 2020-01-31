class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :url_image, null: false
      t.date :start_date, null: false
      t.date :final_date, null: false

      t.timestamps
    end
  end
end
