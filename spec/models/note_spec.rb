require 'spec_helper'

RSpec.describe Note, type: :model do

  context "model specifications" do
    it { belong_to(:user) }
    it { validate_presence_of(:content) }
    it { ensure_length_of(:content).is_at_most(255) }
  end

end
