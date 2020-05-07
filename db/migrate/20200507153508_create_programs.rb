class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.string :title
      t.string :broadcaster
      t.string :wday
      t.string :airtime
      t.integer :user_id

      t.timestamps
    end
  end
end
