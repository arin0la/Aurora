class AddReferencesToMixSound < ActiveRecord::Migration[7.0]
  def change
    add_reference :mix_sounds, :mix
    add_reference :mix_sounds, :sound
  end
end
