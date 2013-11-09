require 'spec_helper'

describe User do

  before { @user = User.new(email: 'user@example.com', password: 'password') }

  subject { @user }
  
  it { should validate_presence_of :email }
  it { should have_many :tweets }
  it { should respond_to(:relationships) }
  it { should respond_to(:followed_users) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }

  describe "following" do
    @other_user = FactoryGirl.create(:user)
    before do
      @user.save
      @user.follow!(@other_user)
    end

    it { should be_following(other_user) }
    its(:followed_users) { should include(other_user) }

    describe "and unfollowing" do
      before { @user.unfollow!(other_user) }
      it { should_not be_following(other_user) }
      its(:followed_users) { should_not include(other_user) }
    end
  end
end
