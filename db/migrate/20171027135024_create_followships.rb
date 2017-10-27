class CreateFollowships < ActiveRecord::Migration[5.1]
  def change
    create_table :followships do |t|
      t.references :user, foreign_key: true
      t.belongs_to :following
      t.timestamps
    end
  end
end
