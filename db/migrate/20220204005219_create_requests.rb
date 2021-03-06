class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.references :puzzle, foreign_key: true
      t.string :status, :default => 'pending'

      t.timestamps
    end
  end
end
