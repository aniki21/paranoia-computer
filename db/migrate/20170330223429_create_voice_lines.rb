class CreateVoiceLines < ActiveRecord::Migration[5.0]
  def change
    create_table :voice_lines do |t|
      t.integer :mission_id
      t.text :lines

      t.timestamps
    end
  end
end
