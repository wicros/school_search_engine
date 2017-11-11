class Add < ActiveRecord::Migration[5.1]
    def change
      add_column :graduate_results, :graduate_num, :integer
    end
end
