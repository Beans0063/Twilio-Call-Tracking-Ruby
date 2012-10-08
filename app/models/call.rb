class Call < ActiveRecord::Base
  attr_accessible :AccountSid, :From, :To, :CallStatus, :ApiVersion, :Direction, :FromCity, :FromState, :FromZip, :FromCountry, :ToCity, :ToState, :ToZip, :ToCountry, :CallSid, :DialCallSid, :DialCallDuration, :DialCallStatus, :RecordingUrl
  
  def self.create_from_incoming_call(params)

    twilio_request_params = {
      :CallSid => params['CallSid'],
      :AccountSid => params['AccountSid'],
      :From => params['From'],
      :To => params['To'],
      :CallStatus => params['CallStatus'],
      :ApiVersion => params['ApiVersion'],
      :Direction => params['Direction'],
    	:FromCity => params['FromCity'],
    	:FromState => params['FromState'],
  	  :FromZip => params['FromZip'],
      :FromCountry => params['FromCountry'],
      :ToCity => params['ToCity'],
      :ToState => params['ToState'],
      :ToZip => params['ToZip'],
      :ToCountry => params['ToCountry']
    }
    
    call = Call.new(twilio_request_params)
    call.save  
    return call

  end

  def Call.update_dial_call(params)

    twilio_request_params = {
    	:DialCallSid => params['DialCallSid'],
    	:DialCallDuration => params['DialCallDuration'],
    	:DialCallStatus => params['DialCallStatus'],
    	:RecordingUrl => params['RecordingUrl'],
    	:DialCallMinutes => (params['DialCallDuration'].to_f/60.to_f).ceil
  	}

  	call = Call.where( :CallSid => params['CallSid'] ).first
  	call.update_attributes twilio_request_params
  	call.save
  
  end
  
end
