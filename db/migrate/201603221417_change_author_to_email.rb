class ChangeAuthorToEmail	 < ActiveRecord::Migration
  def change
    change_column :articles, :author, :email
  end
end