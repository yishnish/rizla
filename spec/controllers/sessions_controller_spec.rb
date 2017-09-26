require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    User.create(name: 'test_user', password: 'password1')
  end
  describe 'logging in' do
    describe 'successfully' do
      describe 'when the user is not being redirected from another page' do
        it 'redirects to the welcome action' do
          post :create, name: 'test_user', password: 'password1'
          assert_redirected_to root_url
        end
      end
      describe 'when the user gets redirected from another page' do
        it 'redirects the user back to the originally requested page' do
          session[:return_to] = 'example.com'
          post :create, name: 'test_user', password: 'password1'
          assert_redirected_to 'example.com'
        end
      end
    end

    describe 'with validation errors' do
      subject {post :create, name: 'test_user', password: 'badd password'}
      it 'redirects to the login page' do
        expect(subject).to render_template :new
      end
    end
  end

end
