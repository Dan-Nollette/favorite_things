require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the list path', {:type => :feature}) do
  it('displays item name and rank') do
    visit('/')
    fill_in('name', :with => 'Megan')
    fill_in('rank', :with => '1')
    click_button('Go!')
    expect(page).to have_content('Megan 1')
  end
end
describe('the item path', {:type => :feature}) do
  it('displays name on click') do
    visit('/items/1')
    expect(page).to have_content('Megan')
  end
end
