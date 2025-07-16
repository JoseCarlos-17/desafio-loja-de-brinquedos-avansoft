require 'rails_helper'

RSpec.describe Sale, type: :model do
  context 'attributes' do
    it { is_expected.to have_db_column(:date) }
    it { is_expected.to have_db_column(:value) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:client) }
  end
end
