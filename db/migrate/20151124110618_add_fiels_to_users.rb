class AddFielsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birth_date, :date
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :availability, :boolean
    add_column :users, :speciality, :string
    add_column :users, :biography, :text
    add_column :users, :siren, :string
    add_column :users, :document_identity, :string
    add_column :users, :company_name, :string
    add_column :users, :website_url, :string
    add_column :users, :sociallink1, :string
    add_column :users, :sociallink2, :string
    add_column :users, :sociallink3, :string
  end
end
