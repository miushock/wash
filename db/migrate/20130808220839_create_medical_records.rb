class CreateMedicalRecords < ActiveRecord::Migration
  def change
    create_table :medical_records do |t|
      t.string :serial_number
      t.string :patient
      t.string :creator
      t.string :reviewer
      t.binary :content

      t.timestamps
    end
  end
end
