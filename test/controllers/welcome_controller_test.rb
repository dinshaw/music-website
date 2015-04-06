require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  describe '#index'  do
    before { get :index }

    it 'renders in the guest layout' do
      assert_template layout: 'guest'
    end
  end

end
