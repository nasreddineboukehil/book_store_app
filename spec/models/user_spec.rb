require 'rails_helper'

RSpec.describe User, :type => :model do
  it "requires a first name" do
    john = User.new(first_name: nil, last_name: "Doe", email: "john.doe@example.com",
                    password: "password")

    expect(john).to_not be_valid
    expect(john.errors[:first_name].any?).to be_truthy
  end

  it "requires a last name" do
    john = User.new(first_name: "John", last_name: nil, email: "john.doe@example.com",
                    password: "password")

    expect(john).to_not be_valid
    expect(john.errors[:last_name].any?).to be_truthy
  end
  it "requires an email" do
    john = User.new(first_name: "John", last_name: "Doe", email: nil,
                    password: "password")

    expect(john).to_not be_valid
    expect(john.errors[:email].any?).to be_truthy
  end
  it "requires a password" do
    john = User.new(first_name: "John", last_name: "Doe", email: "john.doe@example.com",
                    password: nil)

    expect(john).to_not be_valid
    expect(john.errors[:password].any?).to be_truthy
  end
  describe "#full_name" do
    it "requires a #full_name" do
      john = User.create(first_name: "John", last_name: "Doe", email: "john.doe@example.com",
                      password: "password")
      expect(john.full_name).to eq('John Doe')
    end
  end
end
