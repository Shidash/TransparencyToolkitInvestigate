# config/initializers/carrierwave.rb

CarrierWave.configure do |config|

  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
      config.root = "#{Rails.root}/tmp"
    end
  end

  # Use AWS storage if in production
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end

  config.fog_credentials = {
    :provider               => 'AWS',                             # required
    :aws_access_key_id      => '<your key goes here>',            # required
    :aws_secret_access_key  => '<your secret key goes here>',     # required
  }
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_directory  = '<bucket name goes here>'               # required
  #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
  config.fog_public     = true                                  # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
