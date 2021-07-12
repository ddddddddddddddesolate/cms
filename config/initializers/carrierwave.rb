AWS_CONFIG = Rails.application.credentials.aws

CarrierWave.configure do |config|
  config.storage = :aws
  config.aws_bucket = AWS_CONFIG[:s3_bucket_name]
  config.aws_acl = "private"

  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  config.aws_credentials = {
    access_key_id: AWS_CONFIG[:access_key_id],
    secret_access_key: AWS_CONFIG[:secret_access_key],
    region: AWS_CONFIG[:region],
  }
end
