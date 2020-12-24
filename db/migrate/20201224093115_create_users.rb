class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :provider, default: "google_oauth2"
      t.string :uid
      t.string :name, null: false
      t.string :email, null: false
    end
  end
end
