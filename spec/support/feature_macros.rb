module FeatureMacros
  def login(user = nil, skip_site = false)
    setup_site unless skip_site
    user ||= FactoryGirl.create(:writer)
    visit main_app.new_user_session_path
    
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    
    click_on "Sign in"
    page.should have_content("Signed in successfully.")
    @current_user = user
  end

  def login_admin(admin = nil)
    login FactoryGirl.create(:admin)
  end

  def login_editor(editor = nil)
    login FactoryGirl.create(:editor)
  end

  def login_writer(writer = nil)
    login FactoryGirl.create(:writer)
  end
  
  def current_user
    @current_user
  end

  def current_site
    @current_site
  end

  def setup_site
    @current_site = FactoryGirl.create(:site)
  end

  def base_url
    "http://#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}"
  end
end
