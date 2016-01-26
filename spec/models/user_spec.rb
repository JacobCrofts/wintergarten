require 'rails_helper'

describe User do
  # let(:user) { User.new}

  it "creates a new user" do
    user1 = User.create!(username: "mj", password_digest: "mj", email: "mj")
    expect(user1).to be_a(User)
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
end
