class CreateFlags < ActiveRecord::Migration[6.0]
  def change
    create_table :flags do |t|
      t.references :survivor, foreign_key: true
      t.integer :flagger_id
      
      t.timestamps
    end
  end
end
