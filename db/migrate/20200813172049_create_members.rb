class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.references :campaign, foreign_key: true
      t.boolean :open
      t.string :token

      t.timestamps
    end
  end
end
