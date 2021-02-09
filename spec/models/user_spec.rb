require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'password and password_confirmation must match' do
      @user = User.new(:first_name => 'First', :last_name => 'Last', :email => 'test@test.com', :password => 'password', :password_confirmation => 'password')

      expect(@user).to be_valid
    end

    it 'password and password_confirmation not valid if not matching' do
      @user = User.new(:first_name => 'First', :last_name => 'Last', :email => 'test@test.com', :password => 'password', :password_confirmation => 'confirm password')

      expect(@user).to_not be_valid
    end
   
    it 'emails must be unique' do
      @user = User.new(:email => 'TEST@TEST.COM', :password => 'password', :password_confirmation => 'password')
      @user.save

      @user1 = User.new(:email => 'test@test.COM', :password => 'password', :password_confirmation => 'password')

      expect(@user1).to_not be_valid
    end

    it 'email, first name and last name should be required' do
      @user = User.new(:first_name => 'First', :last_name => 'Last', :email => 'test@test.com', :password => 'password')

      expect(@user).to be_valid
    end

    it 'password should have minimum length of 6 characters' do
      @user = User.new(:first_name => 'First', :last_name => 'Last', :email => 'test@test.com', :password => 'short', :password_confirmation => 'short')
    
      expect(@user).to_not be_valid
    end

    it 'password should have minimum length of 6 characters' do
      @user = User.new(:first_name => 'First', :last_name => 'Last', :email => 'test@test.com', :password => 'notshort', :password_confirmation => 'notshort')
    
      expect(@user).to be_valid
    end

  end


  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'authenticates the user with email and password' do
      @user = User.new({first_name: 'First', last_name:'Last', email: 'me@email.com', password: '12345678', password_confirmation: '12345678'})
      @user.save
      user = User.authenticate_with_credentials('me@email.com', '12345678')

      expect(user).to_not be_nil
    end

    it 'email is case insensitive' do
      @user = User.new({email: 'eXample@domain.COM', password: '12345678', password_confirmation: '12345678', first_name: 'First', last_name:'Last'})
      @user.save
      user = User.authenticate_with_credentials('EXAMPLe@DOMAIN.CoM', '12345678')

      expect(user).to_not be_nil
    end
    
    it 'email with spaces before or after should be vali' do
      @user = User.new({email: 'test@test.com', password: '12345678', password_confirmation: '12345678', first_name: 'First', last_name:'Last'})
      @user.save
      user = User.authenticate_with_credentials('  test@test.com', '12345678')

      expect(user).to_not be_nil
    end

  end

end