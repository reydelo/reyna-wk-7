require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates a user with a unique username" do
    user1 = User.create(user_name: 'Reydelo', password: 'meow')
    user2 = User.create(user_name: 'Reydelo', password: '1234')
    expect(user1).to be_valid
    expect(user2).to be_invalid
  end
  
end
