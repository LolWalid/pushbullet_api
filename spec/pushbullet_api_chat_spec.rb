require 'spec_helper'

describe PushbulletApi::Chat do
  before(:each) do
    VCR.use_cassette('pushbullet_user') do
      @user = PushbulletApi::User.new(ACCESS_TOKEN)
    end
  end

  it 'has CRUD services' do
    VCR.use_cassette('create_chat') do
      chat = @user.start_chat_with('rspec@pushbulletapi.com')
      expect(chat).to exist
    end

    VCR.use_cassette('list_chats') do
      chats = @user.chats
      expect(chats).to exist
    end

    VCR.use_cassette('update_chat') do
      chat.update(muted: true)
      expect(chat.muted).to be(true)
    end

    VCR.use_cassette('destroy_chat') do
      expect(chat.destroy).to_be(true)
    end
  end
end
