class CreatePuzzles < ActiveRecord::Migration[5.2]
  def change
    create_table :puzzles do |t|
      t.references :user, foreign_key: true
      t.string :image
      t.string :category
      t.string :description
      t.string :piece_count
      t.string :missing_pieces
      t.boolean :availability
      t.string :difficulty
      t.string :quality

      t.timestamps
    end
  end
end
