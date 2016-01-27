require 'spec_helper'

describe PushbulletApi::User do
  before(:each) do
    @user = PushbulletApi::User.new
  end

  it 'has my information' do
    expect(@user.email).to be_not(nil)
  end
end
