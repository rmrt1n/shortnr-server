class CreateUrlObjects < ActiveRecord::Migration[7.0]
  def change
    create_table :url_objects do |t|
      t.string :slug
      t.string :long_url

      t.timestamps
    end
  end
end
