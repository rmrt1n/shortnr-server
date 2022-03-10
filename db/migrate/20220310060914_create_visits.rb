class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.string :slug
      t.string :ip
      t.string :location

      t.timestamps
    end
  end
end
