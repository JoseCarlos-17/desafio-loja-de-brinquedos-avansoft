require 'rails_helper'

RSpec.describe Admin, type: :model do
  context 'attributes' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:email) }
  end
end
