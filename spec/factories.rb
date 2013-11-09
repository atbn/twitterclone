require 'spec_helper'

FactoryGirl.define do

  factory :user do
    email 'user@something.com'
    password 'password'
  end

  factory :tweet do
    content 'try this out'
  end

end