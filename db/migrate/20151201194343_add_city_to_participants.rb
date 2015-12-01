class AddCityToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :city, :string
  end
end
