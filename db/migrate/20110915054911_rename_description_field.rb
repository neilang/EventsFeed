class RenameDescriptionField < ActiveRecord::Migration
  def change
    rename_column :events, :description, :notes
  end
end
