class CreateGroupEntities < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :entities do |t|
      t.index [:group_id, :entity_id]
      
      t.timestamps
    end
  end
end
