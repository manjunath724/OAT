class AddNameAndTypeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :type, :string, null: false, default: 'Employer'
  end
end
