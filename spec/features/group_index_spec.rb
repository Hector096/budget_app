require 'rails_helper'

RSpec.feature 'Group index', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Himas', email: 'him@mail.com', password: '123456')
    @group = Group.create(user_id: @user.id, name: 'Food', icon: 'https://images.unsplash.com/photo-1553846830-8fb467fe2453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit groups_path
  end

  scenario 'display My Groups on page' do
    expect(page).to have_content('Food')
    expect(page).to have_content('Total amount spent:')
  end

  scenario 'display Group details on page' do
    expect(page).to have_content @group.name
  end

  scenario 'display Add New Category button on page' do
    expect(page).to have_link 'Add category'
  end

  scenario 'When I click on group name, I am redirected to the entity of that specific group.' do
    click_link('Food')
    expect(page).to have_current_path group_entities_path(@group.id)
  end

  scenario 'When I click on Add category, I am redirected to that Group\'s new page.' do
    click_link('Add category')
    expect(page).to have_current_path new_group_path
  end
end
