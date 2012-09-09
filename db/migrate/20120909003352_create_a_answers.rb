class CreateAAnswers < ActiveRecord::Migration
  def change
    create_table :a_answers do |t|
      t.string :text
      t.integer :question_id

      t.timestamps
    end
  end
end
