# == Schema Information
#
# Table name: jokes
#
#  id         :bigint           not null, primary key
#  value      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Joke < ApplicationRecord
end
