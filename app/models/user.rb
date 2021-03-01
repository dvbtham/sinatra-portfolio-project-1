class User < ActiveRecord::Base
 #need secure password method here

 has_many :paintings
 has many :artists, through: :paintings

end 