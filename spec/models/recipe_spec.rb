require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context "validations" do

    describe "validates presence title" do
      it { is_expected.to validate_presence_of(:title) }
    end

    # happy_path
    describe "can be created when title is present" do
      When(:recipe) { Recipe.create(
        title: "Chicken Snitzel",
      )}
      Then { recipe.valid? == true }
    end

    # unhappy_path
    describe "cannot be created without a title" do
      When(:recipe) { Recipe.create(description: "Heavely Chicken") }
      Then { recipe.valid? == false }
    end

  end

  context 'associations with dependency' do
    it { is_expected.to have_many(:ingredients).dependent(:destroy)}
    it { is_expected.to have_many(:favourites).dependent(:destroy)}
    it { is_expected.to have_many(:favourites).dependent(:destroy)}
  end

  context 'titleize name' do
  	describe 'title of recipe will be capitalize after save' do
  		When(:recipe) {Recipe.create(
  			title: "chicken snitzel"
  		)}

  		Then { recipe.title == 'Chicken Snitzel'}
  	end
  end
end
