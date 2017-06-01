require 'rails_helper.rb'


RSpec.describe "recipes/index.html.erb", type: :view do
  it "displays the home button that links to root path" do
    render
    expect(rendered).to have_link("Home", href: '/')
  end

  context "logged in" do
    it "display log out button" do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      render
      expect(rendered).to have_link("Logout", href: "/sessions/#{user.id}")
    end
  end

  context "not logged in" do
    it "display log in button" do
      render
      expect(rendered).to have_link("Login", href: 'sessions/new')
    end
  end
end