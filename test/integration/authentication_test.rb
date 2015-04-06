require 'integration_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest

  let(:user) { users(:jayne) }

  scenario 'signing in' do
    skip
    visit '/'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: default_password
    click_button 'Sign in'
    page.must_have_content 'Signed in successfully'
  end

end
