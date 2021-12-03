require 'capybara/rspec'
require_relative '../../app'
require 'date'
Capybara.app = BirthdayApp

feature 'fill in name and birthday' do
  before(:each) do 
    visit('/')
  end

  scenario 'home page greets user' do 
    expect(page).to have_content 'Hello there!'
  end

  scenario 'home page has a box to enter name' do
    expect(page.has_field?('name')).to be_truthy
  end

  scenario 'home page has a box to enter day' do
    expect(page.has_field?('day')).to be_truthy
  end

  scenario 'home page has a drop down list for month' do
    expect(page.has_field?('month')).to be_truthy
  end

end

feature "rejects invalid birthdays" do
  before(:each) do 
    visit('/')
    fill_in('name', with: 'Kim')
    fill_in('day', with: 32)
    select 'May', from: 'month'
    click_button('Submit')
  end

  scenario 'should not accept an invalid birthday' do
    expect(page).to have_content "Invalid birthday, please try again!"
  end

  scenario 'should allow user to return to home' do
    expect(page.has_button?('Back')).to be_truthy
  end

  scenario 'should successfully get back to home page' do
    click_button('Back')
    expect(page).to have_content 'Hello there!'
  end
end

feature "celebrates current birthdays" do
  before(:each) do 
    visit('/')
    fill_in('name', with: 'Kim')
    fill_in('day', with: 3)
    select Date::MONTHNAMES[Time.now.month], from: 'month'
    click_button('Submit')
  end

  scenario 'should celebrate user birthday' do
    expect(page).to have_content "Happy Birthday, Kim!"
  end

end