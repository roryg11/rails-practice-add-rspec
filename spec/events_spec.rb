require 'rails_helper'

feature 'CRUDing events' do
  scenario 'User edits an event' do
    Event.create!(
    description: "SantaCon"
    )

    visit root_path
    click_on "edit"
    fill_in :Location, with: "Union Square"
    click_on "Update Event"

    expect(page).to have_content("Union Square")
  end

  scenario 'User creates an event' do

    visit root_path
    click_on "New Event"
    fill_in :Description, with: "SantaCon"
    click_on "Create Event"

    expect(page).to have_content("SantaCon")
  end

  scenario 'deleting events' do
    Event.create!(
    description: "SantaCon"
    )

    visit root_path
    click_on "delete"

    expect(page).to have_no_content("SantaCon")
    expect(page.current_path).to eq(events_path)
  end

  scenario 'listing events' do
    Event.create!(
     description: 'free lunch'
    )

    Event.create!(
    description: 'Hug Momo'
    )

    Event.create!(
    description: 'Ramen Festival'
    )

    visit root_path

    expect(page).to have_content('Hug Momo')
    expect(page).to have_content('free lunch')
    expect(page).to have_content('Ramen Festival')
  end
end
