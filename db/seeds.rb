User.destroy_all

u1 = User.create :username => 'gary', :email => 'a@example.com', :password => 'hotdogs', :password_confirmation => 'hotdogs'
u2 = User.create :username => 'ben', :email => 'b@example.com', :password => 'hotchicken', :password_confirmation => 'hotchicken'
u3 = User.create :username => 'mark', :email => 'c@example.com', :password => 'hotmonk',   :password_confirmation => ''