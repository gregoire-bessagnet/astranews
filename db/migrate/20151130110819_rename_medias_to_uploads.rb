class RenameMediasToUploads < ActiveRecord::Migration
  def change
    rename_table(:upload, :uploads)
  end
end
