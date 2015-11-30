class RenameMediaToUpload < ActiveRecord::Migration
  def change
    rename_table(:media, :upload)
  end
end
