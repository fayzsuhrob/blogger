# class Author < ApplicationRecord
#   authenticates_with_sorcery!
# end

class Author < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match confirmation", if: :password
end