require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe 'GET #index' do
    describe 'when not logged in' do
      it 'redirects to the log in page' do
        get :index
        expect(response).to redirect_to(new_session_url)
      end
    end

    describe 'when logged in' do
      before do
        @user = User.create(name: 'test_user', password: 'password1')
      end
      it 'renders the page' do
        session[:user_id] = @user.id
        get :index
        expect(response).to render_template :index
      end
    end
  end
end
