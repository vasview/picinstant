class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :nickname

      t.timestamps null: false
    end
  end
end
