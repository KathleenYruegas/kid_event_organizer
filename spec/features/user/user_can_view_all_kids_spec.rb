require "rails_helper"

describe "As an authenticated User" do
  describe "when I visit kid index page" do
    it 'should show all kids' do

      user = create(:user)
      kid_1 = user.kids.create(name: "Kid 1")
      kid_2 = user.kids.create(name: "Kid 2")
      kid_3 = user.kids.create(name: "Kid 3")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit kids_path

      expect(page).to have_content(kid_1.name)
      expect(page).to have_content(kid_2.name)
      expect(page).to have_content(kid_3.name)

      click_on(kid_1.name)
      expect(current_path).to eq(kid_path(kid_1))
      expect(page).to have_content(kid_1.name)

      visit kids_path
      click_on(kid_2.name)
      expect(current_path).to eq(kid_path(kid_2))
      expect(page).to have_content(kid_2.name)
    end
  end
end
