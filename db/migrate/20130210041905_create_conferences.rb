class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
