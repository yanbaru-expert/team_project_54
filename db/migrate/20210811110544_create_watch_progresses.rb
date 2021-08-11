class CreateWatchProgresses < ActiveRecord::Migration[6.1]
  def change
    create_table :watch_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
