class AddMp3toSound < ActiveRecord::Migration[7.0]
  def change
    add_column :sounds, :mp3, :string
  end
end
