class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :student, index: true
      t.references :course, index: true

      t.timestamps
    end
  end
end
