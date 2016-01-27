require 'spec_helper'

describe PushbulletApi::Subscription do
  before(:each) do
    @user = PushbulletApi::User.new
  end

  it 'has CRUD services' do
    channel = @user.channel_information('elonmusknews')
    subscription = @user.follow_channel(channel.tag)
    expect(subscription).to exist

    subscriptions = @user.subscriptions
    expect(subscriptions).to exist

    subscription.update(muted: true)
    expect(subscription.muted).to be(true)

    expect(subscription.destroy).to_be(true)
  end
end
