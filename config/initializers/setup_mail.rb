ActionMailer::Base.smtp_settings = {  
  #:address              => "smtp.gmail.com",  
  #:port                 => 587,  
  #:address              => "smtp://127.0.0.1",
  #:port                 => 1025,
  :domain               => "gmail.com",  
  :user_name            => "SIBLabTest",  
  :password             => "passworkit",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  
