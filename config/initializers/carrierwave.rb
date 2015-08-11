CarrierWave.configure do |config|
  config.fog_provider = 'fog'                        # required
  config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV['AWS_KEY'],                        # required
      aws_secret_access_key: ENV['AWS_SECRET'],                        # required
      endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'cookio-pics'                          # required
  config.fog_public     = false                                        # optional, defaults to true
end