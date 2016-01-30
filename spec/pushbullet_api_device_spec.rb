require 'spec_helper'

describe PushbulletApi::Device do
  before(:each) do
    VCR.use_cassette('pushbullet_user') do
      @user = PushbulletApi::User.new(ACCESS_TOKEN)
    end
  end

  it 'has CRUD services' do
    device = @user.add_device(nickname: ' Nickname')
    expect(device).to exist

    devices = @user.devices
    expect(devices).to exist

    device.update(nickname: 'New Nickname')
    expect(device.nickname).to be('New Nickname')

    expect(device.destroy).to be(true)
  end

  context 'sending notifications' do
    before(:each) do
      @device = @user.add_device(nickname: ' Nickname')
    end

    xit 'send a sms' do
      message = 'This shouldn\'t work!'
      number = 'XXXXXXXXXX'
      source_user_iden = @user.source_user_iden
      @device.send_sms_notification(message: message, number: number,
                                    source_user_iden: source_user_iden)
    end

    xit 'send a mirrored notification' do
      title = 'Hey i\'m from an API'
      body = 'This shouldn\'t work!'
      source_user_iden = @user.source_user_iden
      @device.send_mirrored_notification(body: body, title: title,
                                         source_user_iden: source_user_iden)
    end
  end
end
