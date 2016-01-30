require 'httparty'

module PushbulletApi
  class User < ApiHandler
    def initialize(access_token = nil)
      super(access_token)
      @attributes = HTTParty.get(HOST + '/users/me',
                                 headers: { 'Access-Token' => @access_token })
    end

    def method_missing(method_name, *arguments, &block)
      super unless @attributes.keys.include?(method_name.to_s)
      @attributes[method_name.to_s]
    end
  end
end
