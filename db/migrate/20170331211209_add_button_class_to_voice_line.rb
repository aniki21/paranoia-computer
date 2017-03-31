class AddButtonClassToVoiceLine < ActiveRecord::Migration[5.0]
  def change
    add_column :voice_lines, :button_class, :string, default: "default"
  end
end
