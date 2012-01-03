require 'spec_helper'
 
describe 'home page' do  
  it 'logs in with invalid credentials' do
    visit '/'
    
    user = create(:user)
    
    fill_in('user[email]', :with => user.email)
    fill_in('user[password]', :with => 'this_is_not_a_valid_password')
    click_button('header_sign_in')
    
    current_path.should == '/users/sign_in'
  end
  
  it 'logs in and out using valid credentials' do
    visit '/'
    
    user = create(:user)
    
    fill_in('user[email]', :with => user.email)
    fill_in('user[password]', :with => user.password)
    click_button('header_sign_in')
    
    current_path.should == '/'
    page.should have_content(user.email)
    
    click_link('Sign out')
    
    current_path.should == '/'
    page.should have_no_content(user.email)
  end
  
  it 'logs in with invalid credentails and then logs into /users/sign_in with invalid credentials' do
    visit '/'
    
    user = create(:user)
    
    fill_in('user[email]', :with => user.email)
    fill_in('user[password]', :with => 'this_is_not_a_valid_password')
    click_button('header_sign_in')
    
    current_path.should == '/users/sign_in'
    
    within("form[@id='user_new']") do
      fill_in('user[email]', :with => 'testing')
      fill_in('user[password]', :with => 'testing')
      click_button('Sign in')
    end
    
    current_path.should == '/users/sign_in'
  end
  
  it 'logs in with invalid credentails and then logs into /users/sign_in with valid credentials' do
    visit '/'
    
    user = create(:user)
    
    fill_in('user[email]', :with => user.email)
    fill_in('user[password]', :with => 'this_is_not_a_valid_password')
    click_button('header_sign_in')
    
    current_path.should == '/users/sign_in'
    
    within("form[@id='user_new']") do
      fill_in('user[email]', :with => user.email)
      fill_in('user[password]', :with => user.password)
      click_button('Sign in')
    end
    
    current_path.should == '/'
    
    click_link('Sign out')
    
    current_path.should == '/'
    page.should have_no_content(user.email)
  end
end