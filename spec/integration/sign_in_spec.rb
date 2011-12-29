require 'spec_helper'
 
describe 'home page' do  
  it 'logs in with invalid credentials' do
    visit '/'
    
    user = create(:user)
    
    fill_in('user[email]', :with => user.email)
    fill_in('user[password]', :with => user.password)
    click_button('header_sign_in')
    
    current_path.should == '/users/sign_in'
  end
  
  it 'logs in using valid credentials' do
    
  end
end