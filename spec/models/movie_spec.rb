require 'spec_helper'
require 'rails_helper'

describe Movie do

  describe 'searching Tmdb by keyword' do
    context 'with valid key' do
      it 'should call Tmdb with title keywords' do
        expect(Tmdb::Movie).to receive(:find).with('Inception')
        Movie.find_in_tmdb('Inception')
      end
    end
    context 'with invalid key' do
      it 'should raise InvalidKeyError if key is missing or invalid' do
      allow(Tmdb::Movie).to receive(:find).and_raise(NoMethodError)
      allow(Tmdb::Api).to receive(:response).and_return('code' => '401')
      expect(Movie).to receive(:find_in_tmdb).with('Inception').and_return(Movie::InvalidKeyError)
      Movie.find_in_tmdb('Inception')
      end
    end
  end
  describe 'name with rating method' do
    fixtures :movies
    it 'should include rating and year in full name' do
      expect(movies(:milk_movie).name_with_rating).to eq('Milk (R)')
    end
  end
end