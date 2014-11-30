# -*- encoding : utf-8 -*-
Devise.setup do |config|

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  # Configure the class responsible to send e-mails.
  # config.mailer = 'Devise::Mailer'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]

  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10

  # rubocop:disable Metrics/LineLength
  config.secret_key = '1eb97ffbe90b20d8a07ed7325cf1436d4f97c4b11822763035e731a3c958d7baf3057d0b332f814cac8a56026178b83d684f64667051b4269aa4aa5f58402fd3'

  config.pepper = '7250a4df5c1b4d5e9cf7784fb73c0d5136a458efe45ba99e0d3de5450e27a05fc0e68f7a50ce4f8564b8c0ff6a84d61f944fbbceb4b00fb58b6752ef3423bd09'
  # rubocop:enable Metrics/LineLength

  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

end
