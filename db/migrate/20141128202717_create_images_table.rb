# -*- encoding : utf-8 -*-
class CreateImagesTable < ActiveRecord::Migration
  def change
    create_table :images, id: :uuid do |t|
      # Image specific columns
      t.string :original_filepath, null: false # The filepath they gave us
      t.string :cached_filepath # Where the unaltered image lives after we've stored it
      t.string :processed_filepath # The final image location
      t.integer :size # File size in bytes
      t.string :format # File format (e.g. PNG, JPEG)
      t.integer :dimensions, array: true # [500, 600]
      t.integer :resolution, array: true # [75, 75]
      t.string :signature

      t.hstore :transformations

      # FK
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
