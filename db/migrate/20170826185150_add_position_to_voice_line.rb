class AddPositionToVoiceLine < ActiveRecord::Migration[5.0]
  def change
    add_column :voice_lines, :position, :integer
  end
end
