user1 = User.new(first_name: 'Edwin', last_name: 'Ting', email: 'edwintwx@gmail.com', password: 'password', city: 'Singapore', country: 'Singapore' )
user1.save!

user2 = User.new(first_name: 'Fionna', last_name: 'Lee', email: 'fionnalee@gmail.com', password: 'password', city: 'Singapore', country: 'Singapore' )
user2.save!

user3 = User.new(first_name: 'Kennie', last_name: 'Ting', email: 'kennie@gmail.com', password: 'password', city: 'Singapore', country: 'Singapore' )
user3.save!


p1 = Post.new(content: 'This is my first content', request: true, user_id: 1)
p1.save!

p2 = Post.new(content: 'This is my 2nd content', request: true, user_id: 2)
p2.save!

p3 = Post.new(content: 'This is my 3rd content', request: true, user_id: 3)
p3.save!

p4 = Post.new(content: 'This is a testimonial', testimonial: true, user_id: 1)
p4.save!

p5 = Post.new(content: 'This is another testimonial content', testimonial: true, user_id: 1)
p5.save!

p6 = Post.new(content: 'This is yet another testimonial content piece', request: true, user_id: 3)
p6.save!
