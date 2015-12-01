class AddAddressToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :address, :string
  end
end
