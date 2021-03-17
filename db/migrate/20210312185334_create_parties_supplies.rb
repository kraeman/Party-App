class CreatePartiesSupplies < ActiveRecord::Migration[6.1]
  def change
    create_table :parties_supplies do |t|
      t.references :party, foreign_key: true
      t.references :supply, foreign_key: true

      t.timestamps
    end
  end
end
