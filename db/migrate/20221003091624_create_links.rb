class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :lookup_code
      t.string :url

      t.timestamps
    end
  end
end
