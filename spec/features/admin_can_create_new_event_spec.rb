# require "rails_helper"
#
# describe "As an authenticated admin" do
#   describe "when I visit kids show page" do
#     it 'should be able to add new event' do
#       kid = create(:kid)
#
#       visit kid_path(kid)
#
#       click_on("Add Event")
#
#       new_event_title = "Soccer"
#       descrip = "Play Soccer"
#       location = "Westminster Rec Center"
#       day = "Monday"
#       time = "9:15 am"
#
#       expect(current_path).to eq(new_kid_event_path(kid))
#       fill_in :event_title, with: new_event_title
#       fill_in :event_description, with: descrip
#       fill_in :event_location, with: location
#       fill_in :event_day_of_week, with: day
#
#       fill_in :time, with: time
#       click_on("Create Event")
#
#       expect(current_path).to eq(kid_path(kid))
#       expect(page).to have_content(kid.name)
#       expect(page).to have_content(new_event_title)
#       expect(page).to have_content(descrip)
#       expect(page).to have_content(location)
#       expect(page).to have_content(time)
#     end
#   end
# end