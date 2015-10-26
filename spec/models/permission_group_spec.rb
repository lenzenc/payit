require 'rails_helper'

RSpec.describe PermissionGroup, :type => :model do

  describe "Associations" do

    it { should have_many(:permissions) }

  end

  describe "Validations" do

    subject { build :permission_group }

    it { should validate_presence_of :code }
    it { should ensure_length_of(:code).is_at_most(20) }
    it { should validate_uniqueness_of :code }

    it { should validate_presence_of :name }
    it { should ensure_length_of(:name).is_at_most(100) }
    it { should validate_uniqueness_of :name }

  end

end
