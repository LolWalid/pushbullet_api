$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pushbullet_api'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock # or :fakeweb
end

# ACCESS_TOKEN = 'XXX'
ACCESS_TOKEN = 'o.f71jKWwtYL8Dg3GWUQ3Voga6XXBPKQvm'
