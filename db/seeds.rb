User.destroy_all
Tweet.destroy_all

u1 = User.create :name => 'gary', :email => 'a@example.com', :password => 'hotdogs', :password_confirmation => 'hotdogs'
u2 = User.create :name => 'ben', :email => 'b@example.com', :password => 'hotchickens', :password_confirmation => 'hotchickens'
u3 = User.create :name => 'mark', :email => 'c@example.com', :password => 'hotmonks',   :password_confirmation => 'hotmonks'

t1 = Tweet.create :content => 'oh yeah'
u1.tweets << t1
t2 = Tweet.create :content => 'what a beautiful day'
u2.tweets << t2
t3 = Tweet.create :content => 'what a day'
u3.tweets << t3

u1.follow(u2)
u1.follow(u3)

u2.follow(u1)

u3.follow(u1)