class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :date_of_birth
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end
