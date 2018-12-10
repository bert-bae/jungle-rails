require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(
      first_name: "Original",
      last_name: "Name",
      email: "email@email.com",
      password: "test1",
      password_confirmation: "test1"
    )
  end

  describe 'User Validations' do
    it 'create new user and save' do
      expect(@user).to be_valid
      puts @user.errors.full_messages
    end

    it 'abort user creation, password_confirmation not matching (password_confirmation)' do
      @user.password_confirmation = "invalid"
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'abort user creation, password/password_confirmation are nil' do
      @user.password_confirmation = nil
      @user.password = nil
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'abort user creation, password not matching (password)' do
      @user.password = "invalid"
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end
    
    it 'should fail without first_name' do
      @user.first_name = nil
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'should fail without email' do
      @user.email = nil
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'user cannot be created if email is not unique' do
      @user.save
      @test = User.new(
        first_name: "Test",
        last_name: "Test",
        email: "email@email.com",
        password: "test1",
        password_confirmation: "test1"
      )
      expect(@test).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'user cannot be created if email is not unique (Case-sensitive)' do
      @user.save
      @test = User.new(
        first_name: "Test",
        last_name: "Test",
        email: "EMAIL@EMAIL.COM",
        password: "test1",
        password_confirmation: "test1"
      )
      expect(@test).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'returns false if password length is less than 4' do
      @user.password = '123'
      @user.password_confirmation = "123"
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'returns true if password length is more than 4' do
      @user.password = '12345'
      @user.password_confirmation = "12345"
      expect(@user).to be_valid
      puts @user.errors.full_messages
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should be nil if password and email do not match with existing account' do
      @user.save
      match = User.authenticate_with_credentials('email@email.com', 'blah')
      expect(match).to be_falsey
    end

    it 'should be true if password and email match with existing account' do
      @user.save
      match = User.authenticate_with_credentials('email@email.com', 'test1')
      expect(match).to be_truthy
    end

    it 'should login with valid credentials even with leading and trailing spaces in email' do
      @user.save
      match = User.authenticate_with_credentials(' email@email.com ', 'test1')
      expect(match).to be_truthy
    end

    it 'should login with valid credentials even with random upper/lowercase placements spaces in email' do
      @user.save
      match = User.authenticate_with_credentials(' eMAil@emaIl.COm ', 'test1')
      expect(match).to be_truthy
    end
  end
end