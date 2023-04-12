class AddReferencestoMixes < ActiveRecord::Migration[7.0]
  def change
    add_reference :mixes, :videos, foreign_key: true
  end
end
