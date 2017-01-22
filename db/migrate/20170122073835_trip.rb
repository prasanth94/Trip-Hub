class Trip < ActiveRecord::Migration
  def change
  	create_table :trips do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
