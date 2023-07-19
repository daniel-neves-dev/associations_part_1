require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:author) {create(:author)}

    context 'Book CRUD' do
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
        let(:valid_attributes) do
          attributes_for(:book, author_id: author.id )
        end

        it 'creates a new book' do
          expect{
            post :create, params:{ book: valid_attributes}
          }.to change(Book, :count).by(1)
        end

        it 'redirects to book show page' do
          post :create, params: {book: valid_attributes}
          expect(response).to redirect_to(assigns(:book))
        end
      end

      context 'with invalid attributes' do
        let(:invalid_attributes) do
          attributes_for(:book, author_id: author.id, title: nil)
        end

        it 'does not create a new book' do
          expect{
            post :create, params: { book: invalid_attributes}
          }.to_not change(Book, :count)
        end

        it 'renders the new template' do
          post :create, params: { book: invalid_attributes}
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'GET #show' do
      it 'renders the show template' do
        book = create(:book)
        get :show, params:{ id:  book.id }
        expect(response).to render_template(:show)
      end
    end

    describe 'GET #edit' do
      it 'renders the edit template' do
        book = create(:book)
        get :edit, params: {id: book.id}
        expect(response).to render_template(:edit)
      end
    end

    describe 'PATCH #update' do
      context 'with valid attributes' do
        let(:book) {create(:book)}
        let(:new_title) {Faker::Book.title}

        it 'updates the book' do
          patch :update, params: {id: book.id, book:{title: new_title}}
          book.reload
          expect(book.title).to eq(new_title)
        end

        it 'redirects to the book show page' do
          patch :update, params: {id: book.id, book:{title: new_title}}
          expect(response).to redirect_to(assigns(:book))
        end
      end

      context 'with invalid attributes' do
        let(:book) {create(:book)}

        it 'does not update the book' do
          original_title = book.title
          patch :update, params: {id: book.id, book:{title: nil}}
          book.reload
          expect(book.title).to eq(original_title)
        end

        it 'renders the edit template' do
          book = create(:book)
          patch :update, params: {id: book.id, book: {title: nil}}
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroy the book' do
        book = create(:book)
        expect{
          delete :destroy, params: {id: book.id}
        }.to change(Book, :count).by(-1)
      end

      it 'redirects to the books index page' do
        book = create(:book)
        delete :destroy, params: {id: book.id}
        expect(response).to redirect_to(books_url)
      end
    end
  end
end