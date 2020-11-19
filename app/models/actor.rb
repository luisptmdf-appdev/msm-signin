# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  
  has_many(:characters, { :class_name => "Character", :foreign_key => "actor_id", :dependent => :destroy })

  has_many(:characters, { :through => :characters, :source => :movie })

  validates(:name, { :presence => true })

  validates(:name, { :uniqueness => { :scope => ["dob"] } })

end
