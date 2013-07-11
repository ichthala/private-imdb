class CreateActors < ActiveRecord::Migration
  def up
    create_table :actors do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :actors
  end
end
