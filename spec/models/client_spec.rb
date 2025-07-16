require 'rails_helper'

RSpec.describe Client, type: :model do
    context 'attributes' do
      it { is_expected.to have_db_column(:name) }
      it { is_expected.to have_db_column(:email) }
    end

    context 'associations' do
      it { is_expected.to have_many(:sales) }
    end
end
