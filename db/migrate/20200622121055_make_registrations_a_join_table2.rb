class MakeRegistrationsAJoinTable2 < ActiveRecord::Migration[6.0]
  def change
  	Registration.all.each do |r|
  		user = User.find_by(email: r.email)
  		r.user_id = user.id
  		r.save
  	end

  	remove_column :registrations, :name, :string
  	remove_column :registrations, :email, :string
  end
end
