class CreateReadProgresses < ActiveRecord::Migration[6.1]
  def change
    create_table :read_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :text, null: false, foreign_key: true

      t.timestamps
    end
    add_index :read_progresses, [:user_id, :text_id], unique: true
  end
end
