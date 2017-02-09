class AddColumn < ActiveRecord::Migration
  def change
    add_column :posts, :overtime, :integer
  end
end
