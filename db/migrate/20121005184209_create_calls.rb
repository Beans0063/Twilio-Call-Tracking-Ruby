class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :AccountSid
      t.string :From
      t.string :To
      t.string :CallStatus
      t.string :ApiVersion
      t.string :Direction
      t.string :FromCity
      t.string :FromState
      t.string :FromZip
      t.string :FromCountry
      t.string :ToCity
      t.string :ToState
      t.string :ToZip
      t.string :ToCountry
      t.string :CallSid
      t.string :DialCallSid
      t.string :DialCallDuration
      t.string :DialCallStatus
      t.string :RecordingUrl
    end
  end
end
