class CreateGroupposts < ActiveRecord::Migration[5.2]
  def change
    create_table :groupposts do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
