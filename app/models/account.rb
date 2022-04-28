# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  amount     :float
#  expiry     :date
#  number     :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin_id   :bigint
#
# Indexes
#
#  index_accounts_on_admin_id  (admin_id)
#
class Account < ApplicationRecord
  validates :number, presence: true, uniqueness: true

  belongs_to :admin
end
