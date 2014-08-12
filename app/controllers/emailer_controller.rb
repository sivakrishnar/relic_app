class EmailerController < ApplicationController

  def get_send_mail
    puts "Inside get mail"
    p request.original_url
    RestClient.post "http://#{request.original_url}/send_mail", {to: "Sai Sujith <sivakr39@yahoo.com>", subject: "hello world", body: "Hi sai! Sending you an email via this API I just made."}.to_json, :content_type => :json, :accept => :json
	RestClient.post "http://#{request.original_url}/send_mail", {to: "Sai Sujith <saisujith717@gmail.com>", subject: "hello world", body: "Hi sai! Sending you an email via this API I just made."}.to_json, :content_type => :json, :accept => :json
  end
  
  def post_send_mail
     toaddr, sub, mbody = params[:to], params[:subject], params[:body]	 

	 Mail.deliver do
       to        toaddr
	   from      'noreply@example.com' 
	   subject   sub 
	   body      mbody 
	 end
	 
	 respond_to do |format|
      format.json { render text: 'Email Sent'}
     end
  end
  
end
