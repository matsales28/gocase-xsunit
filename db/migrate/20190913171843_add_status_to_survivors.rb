class AddStatusToSurvivors < ActiveRecord::Migration[6.0]
  def change
    add_column :survivors, :status , :boolean
  end
end
