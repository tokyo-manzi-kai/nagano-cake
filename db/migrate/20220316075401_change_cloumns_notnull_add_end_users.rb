class ChangeCloumnsNotnullAddEndUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :end_users, :last_name, :string, null: false
    change_column :end_users, :first_name, :string, null: false
    change_column :end_users, :last_name_kana, :string, null: false
    change_column :end_users, :first_name_kana, :string, null: false
    change_column :end_users, :post_code, :string, null: false
    change_column :end_users, :address, :string, null: false
    change_column :end_users, :phone_number, :string, null: false
   
  end
end
