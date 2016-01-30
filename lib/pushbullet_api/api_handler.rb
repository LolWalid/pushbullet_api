module PushbulletApi
  class ApiHandler
    HOST = 'https://api.pushbullet.com/v2'

    def initialize(access_token)
      @access_token = access_token
    end
  end
end
