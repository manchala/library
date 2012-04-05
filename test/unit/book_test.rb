# == Schema Information
#
# Table name: books
#
#  id          :integer(4)      not null, primary key
#  title       :string(32)      not null
#  price       :float
#  subject_id  :integer(4)
#  description :text
#  created_at  :datetime
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
