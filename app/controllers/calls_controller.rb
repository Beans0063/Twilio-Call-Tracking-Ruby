class CallsController < ApplicationController

  def incoming_call
    
    Call.create_from_incoming_call(params)

    response = Twilio::TwiML::Response.new do |r|
      r.Dial :record => 'true', :action=> '/calls/dial_call_ended' do |d|
        d.Number AGENT_NUMBER
      end
    end

    render :text=>response.text,  :content_type => "application/xml"

  end
  
  def dial_call_ended

    Call.update_dial_call(params)

    response = Twilio::TwiML::Response.new
    render :text=>response.text,  :content_type => "application/xml"

  end

end
