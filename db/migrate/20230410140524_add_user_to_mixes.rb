class AddUserToMixes < ActiveRecord::Migration[7.0]
  def change
    add_reference :mixes, :user
  end
end
