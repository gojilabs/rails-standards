Rails.application.config.filter_parameters += %i[
  passw secret token _key crypt salt certificate otp ssn cvv password key private_key
]