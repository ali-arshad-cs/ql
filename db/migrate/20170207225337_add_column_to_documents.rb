class AddColumnToDocuments < ActiveRecord::Migration
  def change
    rename_column :documents, :post_id, :patient_id
    rename_column :patients, :body, :dob
  end
end
