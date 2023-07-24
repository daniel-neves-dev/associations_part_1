require 'rails_helper'

RSpec.describe 'Account Routes', type: :routing do
  it 'routes to account registration' do
    expect(get: '/accounts/sign_up').to route_to('devise/registrations#new')
    expect(post: '/accounts').to route_to('devise/registrations#create')
  end

  it 'routes to user authentication' do
    expect(get: '/accounts/sign_in').to route_to('devise/sessions#new')
    expect(post: '/accounts/sign_in').to route_to('devise/sessions#create')
    expect(delete: '/accounts/sign_out').to route_to('devise/sessions#destroy')
  end
end
