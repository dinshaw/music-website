Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(ENV['aws_access_key_id'], ENV['aws_secret_access_key']),
})
