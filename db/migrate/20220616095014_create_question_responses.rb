class CreateQuestionResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :question_responses do |t|
      t.references :question, null: false, foreign_key: true
      t.boolean :response, null: false
      t.boolean :answer, null: false
      t.boolean :correct, null: false

      t.timestamps
    end
  end
end
