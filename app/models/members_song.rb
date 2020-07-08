class MembersSong < ApplicationRecord
  belongs_to :song
  belongs_to :member
end
