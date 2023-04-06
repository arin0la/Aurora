class CreateMixSounds < ActiveRecord::Migration[7.0]
  def change
    create_table :mix_sounds do |t|
      t.string :name
      t.integer :volume

      t.timestamps
    end
  end
end
