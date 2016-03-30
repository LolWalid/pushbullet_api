require 'spec_helper'

describe PushbulletApi::User do
  before(:each) do
    VCR.use_cassette('pushbullet_user') do
      @user = PushbulletApi::User.new(ACCESS_TOKEN)
    end
  end

  it 'has my information' do
    expect(@user.email).not_to be nil
  end
end
