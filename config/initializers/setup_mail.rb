ActionMailer::Base.smtp_settings = {
  :address              => "smtp.g4solutions.com.br",
  :port                 => 587,
  :domain               => "os.com",
  :user_name            => "luiz.pereira@g4solutions.com.br",
  :password             => "123456789",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"

