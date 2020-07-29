## CarrierWaveの設定
if Rails.env.production?
  CarrierWave.configure do |config|
  # S3の設定
    config.fog_credentials = {
        :provider               => 'AWS',
        :aws_access_key_id      => ENV['S3_ACCESS_KEY'],
        :aws_secret_access_key  => ENV['S3_SECRET__KEY'],
        :region                 => ENV['S3_REGION'],
        # :host                   => '必要なら設定する'
        # :endpoint               => '必要なら設定する'
    }

    # S3のバケットを指定。
    config.fog_directory     = ENV['S3_BUCKET']
  end
end