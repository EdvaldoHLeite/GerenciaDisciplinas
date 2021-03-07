require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'Usuario nao pode ser criado sem senha' do
    user = User.new login: 'Pedro'
    assert_not user.save
  end

  test 'Usuario nao pode ser criado sem login' do
    user = User.new password: '123456', password_confirmation: '123456'
    assert_not user.save
  end

  test 'Nao pode usar login ja criado' do
    user1 = User.new login: 'marcos', password: '123456', password_confirmation: '123456'
    user1.save

    user2 = User.new login: 'marcos', password: '1234567', password_confirmation: '1234567'
    assert_not user2.save
  end
end
