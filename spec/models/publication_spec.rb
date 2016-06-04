require 'rails_helper'

Rspe describe Publication, type: :model do
  it { should belong_to(:author) }
  it { should belong_to(:book) }
end
