require 'spec_helper'

describe PushbulletApi::Chat do
  before(:each) do
    @user = PushbulletApi::User.new
  end

  it 'has CRUD services' do
    chat = @user.start_chat_with('rspec@pushbulletapi.com')
    expect(chat).to exist

    chats = @user.chats
    expect(chats).to exist

    chat.update(muted: true)
    expect(chat.muted).to be(true)

    expect(chat.destroy).to_be(true)
  end
end
