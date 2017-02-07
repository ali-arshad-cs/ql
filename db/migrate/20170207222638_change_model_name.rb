class ChangeModelName < ActiveRecord::Migration
  def change
    rename_table :patients, :patients
  end
end