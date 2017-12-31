require 'spec_helper'
require 'rails_helper'


describe MoviesController do

  # TODO CRUD
  describe 'new' do
    it 'should render the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end
  describe 'create' do
    context 'Valid inputs' do
      it 'should redirect to index template for rendering' do
      end
    end
    context 'Invalid inputs' do
    end
  end
  describe 'index' do

  end
  describe 'show' do
    it 'renders the show template' do
    end
  end
  describe 'edit' do

  end
  describe 'update' do

  end
  describe 'destroy' do

  end
  describe 'search_tmdb' do
    before :each do
      @fake_results = [double('movie1'), double('movie2')]
    end
    it 'should call the model method that performs TMDb search' do
      expect(Movie).to receive(:find_in_tmdb).with('hardware').and_return(@fake_results)
      post :search_tmdb, params: {search_terms: 'hardware'}
    end
    context 'after valid search' do
      before :each do
        allow(Movie).to receive(:find_in_tmdb).and_return(@fake_results)
        post :search_tmdb, params: {search_terms: 'hardware'}
      end
      it 'should select the Search Results template for rendering' do
        expect(response).to render_template('search_tmdb')
      end
      it 'should make the TMDb search results available to that template' do
        expect(assigns(:movies)).to eq(@fake_results)
      end
    end
    context 'after invalid search' do
      before :each do
        allow(Movie).to receive(:find_in_tmdb).and_return([])
        post :search_tmdb, params: {search_terms: 'not exist'}
      end
      it 'should redirect to index template for rendering' do
        expect(response).to redirect_to(movies_path)
      end
    end
  end
end