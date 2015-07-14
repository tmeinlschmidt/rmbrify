require 'spec_helper'

RSpec.describe NotesController, type: :controller do
  include ControllerMacros

  let(:note) { double }

  describe '#new' do

    before(:each) { login_user }

    # missing template?
    xit 'renders new' do
      get :new
      expect(assigns[:note]).to eq(Note.new)
    end
  end

  describe '#destroy' do
    before do
      login_user
      allow(Note).to receive(:find).with('1').and_return(note)
      allow(note).to receive(:destroy).and_return(true)
      delete :destroy, id: 1
    end
    it { expect(note).to have_received(:destroy) }
    it { expect(response).to render_template(nil) }
  end

end
