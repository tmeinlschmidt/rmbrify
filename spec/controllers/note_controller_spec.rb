require 'rails_helper'

class NotesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end
end

describe NotesController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates the note' do
        post :create, note: attributes_for(:note)
        expect(Note.count).to eq(1)
      end
    end
  end
end