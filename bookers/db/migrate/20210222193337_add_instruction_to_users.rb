class AddInstructionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :text
    add_column :users, :title, :string
    add_column :users, :opinion, :text
    add_column :users, :image, :string
  end
end
