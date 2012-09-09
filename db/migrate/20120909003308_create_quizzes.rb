class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.boolean :approved

      t.timestamps
    end
  end
end
