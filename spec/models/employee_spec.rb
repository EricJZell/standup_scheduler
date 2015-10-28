require 'rails_helper'

RSpec.describe Employee do

  describe "#two_active?" do

    let!(:employee1) { FactoryGirl.create(:employee) }
    let!(:employee2) { FactoryGirl.create(:employee) }

    it "returns true with two or more active employees" do
      expect(Employee.two_active?).to be(true)
    end

    it "returns false with less than two active employees" do
      employee1.toggle!(:active)
      expect(Employee.two_active?).to be(false)
    end

  end
end
