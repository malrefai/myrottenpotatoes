require 'spec_helper'
require 'rails_helper'

describe MoviesController do

  describe 'searching TMDb' do

    before :each do
      Movie = double('Movie')
      @fake_results = [double('movie1'), double('movie2')]
    end

    it 'should call the model method that performs TMDb search' do
      expect(Movie).to receive(:find_in_tmdb).with('hardware').and_return(@fake_results)
      post :search_tmdb, params: {search_terms: 'hardware'}
    end

    describe 'after valid search' do

      before :each do
        allow(Movie).to receive(:find_in_tmdb).and_return(@fake_results)
        post :search_tmdb, params: {search_terms: 'hardware'}
      end

      it 'should select the Search Results template for rendering'
      it 'should make the TMDb search results available to that template'
    end

    describe 'after invalid search' do

      before :each do
        allow(Movie).to receive(:find_in_tmdb).and_return([])
        post :search_tmdb, params: {search_terms: 'not exist'}
      end

      it 'should redirect to index template for rendering'
    end
  end
end