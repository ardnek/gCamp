class CreateTableMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :project
      t.belongs_to :user
      t.string :role
      t.timestamps
    end
  end
end
