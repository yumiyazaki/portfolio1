require 'rails_helper'

RSpec.describe User, type: :model do

  it "メール, パスワードがある場合,有効" do
    user = User.new(
      email: "test@com",
      password: "111111"
    )
    expect(user).to be_valid
  end

  it "メールアドレスがない場合,無効" do
    user = User.new(
      email: nil,
      password: "111111"
    )
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "重複したメールアドレスの場合,無効" do
    user1 = User.new(email: "test@com", password: "111111")
    user2 = User.new(email: "test@com", password: "222222")
    user2.valid?
  end

  it "パスワードがない場合,無効" do
    user = User.new(
      email: "test@com",
      password: nil
    )
    user.valid?
    expect(user.errors[:password]). to include("can't be blank")
  end

end
