require 'rails_helper'
RSpec.describe 'Songs' do
  let(:title) { Faker::Lorem.word }
  let(:descripton) { Faker::Lorem.sentance }

  let(:song_1) { Song.create(title: 'foo', description: 'bar') }
  let(:song_2) { Song.create(title: 'lorem', description: 'ipsum') }

  context 'as as admin user' do
    scenario 'I can create songs' do
      visit '/songs'
      click_on 'New Song'
      click_on 'Create'
      # expect(page).to have_content 'Title can\'t be blank'
      fill_in 'Title', with: title
      fill_in 'Description', with: description
      click_on 'Create'
      within '.song' do
        expect(page).to have_content title
        expect(page).to have_content description
      end
    end

    scenario 'I can edit a song' do
      song_1
      visit '/songs'
      click_on song_1.title
      fill_in :description, with: 'foo'
      click_on 'Update'
      expect(page).to have_content 'foo'
    end
  end

  context 'as a user' do
    scenario 'I can see a list of songs' do
      song_1 && song_2
      visit '/songs'
      expect(page).to have_content song_1.title
      expect(page).to have_content song_2.title
    end
  end
end
