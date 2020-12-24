class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.belongs_to :client
      t.string :name
      t.integer :charge
      t.date :start_date
      t.date :end_date
    end
  end
end
