class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :sets
      t.integer :reps
      t.float :weight
      t.references :training, null: false, foreign_key: true

      t.timestamps
    end
  end
end
