require 'spec_helper'

RSpec.describe HomeController, type: :controller do
  include ControllerMacros

  describe '#tour' do
    it 'renders the page' do
      get :tour
      expect(response).to render_template(:tour)
    end
  end

  describe '#register' do

    context 'user is not logged in' do
      it 'renders the page' do
        get :register
        expect(response).to render_template(:register)
      end
    end

    context 'user is logged in' do
      before { login_user }
      it 'redirects the user' do
        get :register
        expect(response).to redirect_to(tour_path)
      end
    end
  end

  describe '#forgot' do

    context 'user is not logged in' do
      it 'renders the page' do
        get :forgot
        expect(response).to render_template(:forgot)
      end
    end

    context 'user is logged in' do
      before { login_user }
      it 'redirects the user' do
        get :forgot
        expect(response).to redirect_to(root_path)
      end
    end
  end

end
