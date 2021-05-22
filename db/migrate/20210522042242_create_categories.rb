class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :time_of_day

      t.timestamps
    end
  end
end
