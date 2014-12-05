class ChangeFormatToMimeType < ActiveRecord::Migration
  def change
    rename_column :images, :format, :mime_type
  end
end
