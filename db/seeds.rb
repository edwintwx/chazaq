user1 = User.new(first_name: 'Edwin', last_name: 'Ting', email: 'edwintwx@gmail.com', password: 'password', city: 'Singapore', country: 'Singapore' )
user1.save!

user2 = User.new(first_name: 'Fionna', last_name: 'Lee', email: 'fionnalee@gmail.com', password: 'password', city: 'Singapore', country: 'Singapore' )
user2.save!

user3 = User.new(first_name: 'Kennie', last_name: 'Ting', email: 'kennie@gmail.com', password: 'password', city: 'Singapore', country: 'Singapore' )
user3.save!

text = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet assumenda in obcaecati esse, aliquam illo soluta itaque aperiam voluptate id. Impedit natus tenetur quisquam ipsa ab ex, praesentium saepe nobis?'

p1 = Post.new(content: text, request: true, isPrivate: false, category: 'request', user_id: 1)
p1.save!

p2 = Post.new(content: text, request: true, isPrivate: false, category: 'request', user_id: 2)
p2.save!

p3 = Post.new(content: text, request: true, isPrivate: true, category: 'request', user_id: 3)
p3.save!

p4 = Post.new(content: text, testimonial: true, isPrivate: false, category: 'testimonial', user_id: 1)
p4.save!

p5 = Post.new(content: text, testimonial: true, isPrivate: false, category: 'testimonial', user_id: 1)
p5.save!

p6 = Post.new(content: text, request: true, isPrivate: false, category: 'request', user_id: 3)
p6.save!
