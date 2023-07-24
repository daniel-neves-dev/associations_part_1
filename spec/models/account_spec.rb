require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'is valid with valid attributes' do
    account = Account.new(email: 'test@example.com', password: 'password')
    expect(account).to be_valid
  end

  it 'is not valid without an email' do
    account = Account.new(password: nil)
    expect(account).not_to be_valid
    expect(account.errors[:email]).to be_present
  end

  it 'is not valid without an password' do
    account = Account.new(email: nil)
    expect(account).not_to be_valid
    expect(account.errors)
  end

  it 'is not valid with a duplicate email' do
    email = 'test@example.com'
    create(:account, email:email)

    account = build(:account, email: email)
    expect(account).not_to be_valid
    expect(account.errors[:email]).to include('has already been taken')
  end
end
