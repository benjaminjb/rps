class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :player1_move
      t.string :player2_move
      t.belongs_to :matches
    end
  end
end
