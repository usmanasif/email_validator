class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    enable_extension("citext")

    create_table :users do |t|
      t.string :first_name, limit: 50, null: false
      t.string :last_name, limit: 50, null: false
      t.citext :email, null: false
      t.string :url, limit: 50, null: false

      t.timestamps
    end
  end
end
