class AddMoreFieldToConferences < ActiveRecord::Migration
  def change
    add_column :conferences, :name, :string
    add_column :conferences, :formatted, :string
    add_column :conferences, :google, :string
    add_column :conferences, :lat, :float
    add_column :conferences, :lng, :float
  end
end
