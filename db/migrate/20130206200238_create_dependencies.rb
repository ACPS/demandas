class CreateDependencies < ActiveRecord::Migration
  def change
    create_table :dependencies do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
