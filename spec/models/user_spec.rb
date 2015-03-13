require 'rails_helper'

describe User do
  describe 'Relationships' do
    it { is_expected.to have_many(:todos) }
  end
end
