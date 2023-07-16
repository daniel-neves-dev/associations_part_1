require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  context 'Author CRUD' do
    describe 'GET #index' do
      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #new' do
      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe 'POST create' do
      context 'with valid attributes' do
        it 'creates a new author' do
          expect{
            post :create, params:{ author: attributes_for(:author)}
          }.to change(Author, :count).by(1)
        end

        it 'redirects to author show page' do
          post :create, params:{ author: attributes_for(:author)}
          expect(response).to redirect_to(assigns(:author))
        end
      end

      context 'with invalid attributes' do
        it 'does not create a new author' do
          expect {
            post :create, params: { author: attributes_for(:author, name: nil) }
          }.to_not change(Author, :count)
        end

        it 'renders the new template' do
          post :create, params: { author: attributes_for(:author, name: nil) }
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'GET #show' do
      it 'renders the show template' do
        author = create(:author)
        get :show, params:{ id:  author.id }
        expect(response).to render_template(:show)
      end
    end

    describe 'GET #edit' do
      it 'renders the edit template' do
        author = create(:author)
        get :edit, params: {id: author.id}
        expect(response).to render_template(:edit)
      end
    end

    describe 'PATCH #update' do
      context 'with valid attributes' do
        it 'updates the author' do
          author = create(:author)
          new_name = Faker::Name.name
          patch :update, params: {id: author.id, author:{name: new_name}}
          author.reload
          expect(author.name).to eq(new_name)
        end
      end
    end
  end
end