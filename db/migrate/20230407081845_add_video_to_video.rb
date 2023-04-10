class AddVideoToVideo < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :mp4, :string
  end
end
