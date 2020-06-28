class MakeRegistrationsAJoinTable < ActiveRecord::Migration[6.0]
  def change
  	Registration.all.each do |r|
  		user = User.all.sample
  		r.name = user.name
  		r.email = user.email
  		r.save
  	end
  	
  	add_column :registrations, :user_id, :integer 
  end

end
