require 'rails_helper'

RSpec.feature 'Group index', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Himas', email: 'him@mail.com', password: '123456')
    @group = Group.create(user_id: @user.id, name: 'Food', icon: 'https://images.unsplash.com/photo-1553846830-8fb467fe2453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit new_group_path
  end

  scenario 'display My Groups on page' do
    expect(page).to have_content('Add your category')
    expect(page).to have_content('Name')
    expect(page).to have_content('Icon')
  end

  scenario 'display Add New Category button on page' do
    expect(page).to have_button 'Save'
  end

  scenario 'display back link on page' do
    expect(page).to have_content('<')
  end

  scenario 'When I click on back < , I am redirected to that Group\'s page.' do
    click_link('<')
    expect(page).to have_current_path groups_path
  end
end
