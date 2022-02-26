require 'rails_helper'

RSpec.feature 'Entity New', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Himas', email: 'him@mail.com', password: '123456')
    @group = Group.create(user_id: @user.id, name: 'Food', icon: 'https://images.unsplash.com/photo-1553846830-8fb467fe2453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80')
    @entity = Entity.create(name: 'Burger', amount: 10, user_id: @user.id, group_id: @group.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit new_group_entity_url(@group.id)
  end

  scenario 'display My Entitys on page' do
    expect(page).to have_content('Add your transaction')
    expect(page).to have_content('Name')
    expect(page).to have_content('Amount')
  end

  scenario 'display Add New Category button on page' do
    expect(page).to have_button 'Save'
  end

  scenario 'display back link on page' do
    expect(page).to have_content('<')
  end
end
