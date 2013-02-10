class AddStateProviceToConferences < ActiveRecord::Migration
  def change
    add_column :conferences, :state_province, :string
  end
end
