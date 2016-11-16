class CreatingBarbers < ActiveRecord::Migration
  def change
    create_table :barbers do |t|
        t.string :name
        t.string :shop

        t.timestamps null: false
    end
  end
end
