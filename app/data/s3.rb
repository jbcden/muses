class S3
  def self.s3_credentials_test
    {:bucket => ENV['S3_BUCKET_TEST'], :access_key_id => ENV['S3_ACCESS_KEY_TEST'], :secret_access_key => ENV['S3_SECRET_ACCESS_KEY_TEST']}
  end

  def self.s3_credentials_production
    {:bucket => ENV['S3_BUCKET_PRODUCTION'], :access_key_id => ENV['S3_ACCESS_KEY_PRODUCTION'], :secret_access_key => ENV['S3_SECRET_ACCESS_KEY_PRODUCTION']}
  end
end
