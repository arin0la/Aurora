class CreateMixes < ActiveRecord::Migration[7.0]
  def change
    create_table :mixes do |t|
      t.string :name

      t.timestamps
    end
  end
end
