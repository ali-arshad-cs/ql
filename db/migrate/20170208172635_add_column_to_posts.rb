class AddColumnToPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :title, :date
    rename_column :posts, :dob, :qc_done
    add_column :posts, :description, :text
  end
end
