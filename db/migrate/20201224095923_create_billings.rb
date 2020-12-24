class CreateBillings < ActiveRecord::Migration[6.0]
  def change
    create_table :billings do |t|
      t.belongs_to :client
      t.integer :number_of_services
      t.integer :amount
    end
  end
end
