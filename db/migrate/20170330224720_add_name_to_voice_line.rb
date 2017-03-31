class AddNameToVoiceLine < ActiveRecord::Migration[5.0]
  def change
    add_column :voice_lines, :name, :string
  end
end
