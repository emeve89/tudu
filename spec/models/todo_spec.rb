require 'rails_helper'

describe Todo do
  describe 'Attributes' do
    it { is_expected.to have_db_column(:content).of_type(:text) }
    it { is_expected.to have_db_column(:done).of_type(:boolean) }
  end
  describe 'Ralationships' do
    it { is_expected.to belong_to(:user) }
  end
end
