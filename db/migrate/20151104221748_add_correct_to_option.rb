class AddCorrectToOption < ActiveRecord::Migration
  def change
    add_column :options, :correct, :boolean
  end
end
