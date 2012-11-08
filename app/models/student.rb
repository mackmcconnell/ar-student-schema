require_relative '../../db/config'
class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :gender, :birthday, :email, :phone, :name

   validates :email, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
   validates :age, :numericality => { :greater_than => 5 }
   validates :phone, :length => { :minimum => 10 }


  def age
    Time.now.year - birthday.year
  end



end