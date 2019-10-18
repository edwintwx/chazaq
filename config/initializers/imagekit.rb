Imagekit.configure do |config|
  config.public_key     = ENV["IMAGEKIT_PUBLIC_KEY"]
  config.private_key    = ENV["IMAGEKIT_PRIVATE_KEY"]
  config.imagekit_id    = ENV["IMAGEKIT_ID"]
  #config.use_subdomain  = false (default false)
  #config.use_secure     = true (default true)
end
