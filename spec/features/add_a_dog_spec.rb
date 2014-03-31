require 'spec_helper'

feature 'add a dog', %Q{
  As a dog owner
  I want to register my dog
  So that I can connect with other dog lovers
 } do

  # Acceptance Criteria:

  # An owner must specify their first name, last name, email address, and dog's name.
  # Upon adding my entry, I can see a list of other registered dog owners.
  # An owner's full_name can be requested. Hint: This will require an instance method

  scenario 'create a valid dog registration' do
    prev_count = DogRegistration.count
    visit new_dog_registration_path
    fill_in 'First name',
      with: 'Dean'
    fill_in 'Last name',
      with: 'Pelton'
    fill_in 'Email',
      with: 'dean@greendale.com'
    fill_in 'Dog name',
      with: 'Greendale'
    # save_and_open_page
    click_button 'Create Dog Registration'
    expect(page).to have_content('Dog Registration Created')
    expect(DogRegistration.count).to eql(prev_count + 1)
  end

  scenario 'create an invalid dog registration' do
    visit new_dog_registration_path
    fill_in 'First name',
      with: ''
    fill_in 'Last name',
      with: ''
    fill_in 'Email',
      with: ''
    fill_in 'Dog name',
      with: ''
    click_button 'Create Dog Registration'
    expect(page).to have_content('Registration Not Saved')
  end

end
