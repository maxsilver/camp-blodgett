require 'spec_helper'

describe CamperRegistration do
  before do
    @camper_registration = CamperRegistration.new(
      last_name: "John",
      first_name: "Smith",
      gender: "M",
      address: "123 Fake St",
      city: "Grand Rapids",
      state: "MI",
      zip: "49505",
      adult_shirt_size: "L"
    )
  end

  let(:home_phone) { '(111) 111-1111' }
  let(:cell_phone) { '(222) 222-2222' }
  let(:work_phone) { '(333) 333-3333' }

  subject { @camper_registration }

  describe "parent/guardian phone" do
    describe "when all three phone numbers are present" do
      before do
        @camper_registration.update_attributes!(
          parent_or_guardian_home_phone: home_phone,
          parent_or_guardian_cell_phone: cell_phone,
          parent_or_guardian_work_phone: work_phone
        )
      end

      it "returns home phone" do
        expect(@camper_registration.parent_or_guardian_preferred_phone).to eq(home_phone)
      end
    end

    describe "when home phone is absent but cell and work are present" do
      before do
        @camper_registration.update_attributes!(
          parent_or_guardian_home_phone: "",
          parent_or_guardian_cell_phone: cell_phone,
          parent_or_guardian_work_phone: work_phone
        )
      end

      it "returns cell phone" do
        expect(@camper_registration.parent_or_guardian_preferred_phone).to eq(cell_phone)
      end
    end

    describe "when only work phone is present" do
      before do
        @camper_registration.update_attributes!(
          parent_or_guardian_home_phone: "",
          parent_or_guardian_cell_phone: "",
          parent_or_guardian_work_phone: work_phone
        )
      end

      it "returns work phone" do
        expect(@camper_registration.parent_or_guardian_preferred_phone).to eq(work_phone)
      end
    end
  end
end
