require_relative '../../db/config'
class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :gender, :birthday, :email,:phone

   validates :email, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
   validates :age, :numericality => { :greater_than => 5 }
   validates :phone, :length => { :minimum => 10 }


  def name
    first_name + " " + last_name
  end

  def age
    Time.now.year - birthday.year
  end


end