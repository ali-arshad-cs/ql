class AddColumnToDocuments < ActiveRecord::Migration
  def change

    rename_column :posts, :body, :dob
  end
end
