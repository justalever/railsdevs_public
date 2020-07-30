# == Schema Information
#
# Table name: jobs
#
#  id                  :bigint           not null, primary key
#  company_name        :string
#  company_website     :string
#  compensation_range  :string
#  link_to_apply       :string
#  remote              :boolean          default(FALSE)
#  role_type           :string
#  title               :string
#  years_of_experience :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :bigint           not null
#
# Indexes
#
#  index_jobs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
