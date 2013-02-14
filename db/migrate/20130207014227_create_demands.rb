class CreateDemands < ActiveRecord::Migration
  def change
    create_table :demands do |t|
      t.string :name
      t.string :last_name
      t.string :address
      t.text :case
      t.string :estado
      t.references :dependency
      t.references :user
      t.timestamps
    end
    add_index :demands, :dependency_id
  end
end
