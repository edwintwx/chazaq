PostPhoto.destroy_all
Post.destroy_all
User.destroy_all

user1 = User.new(first_name: 'Edwin', last_name: 'Ting', email: 'edwintwx@gmail.com', password: 'password', city: 'Singapore', country: 'Singapore' )
user1.save!

user2 = User.new(first_name: 'Fionna', last_name: 'Lee', email: 'fionnalee@gmail.com', password: 'password', city: 'Singapore', country: 'Singapore' )
user2.save!

user3 = User.new(first_name: 'Kennie', last_name: 'Ting', email: 'kennie@gmail.com', password: 'password', city: 'Singapore', country: 'Singapore' )
user3.save!

text1 = 'These things I have spoken to you, that in Me you may have peace. In the world you will have tribulation; but be of good cheer, I have overcome the world.'
p1 = Post.new(content: text1, request: true, isPrivate: false, category: 'request', user_id: 1)
p1.save!

text2 = 'Do you not know that you are the temple of God and that the Spirit of God dwells in you?'
p2 = Post.new(content: text2, request: true, isPrivate: false, category: 'request', user_id: 2)
p2.save!

text3 = 'But you, beloved, building yourselves up on your most holy faith, praying in the Holy Spirit, keep yourselves in the love of God, looking for the mercy of our Lord Jesus Christ unto eternal life.'
p3 = Post.new(content: text3, request: true, isPrivate: true, category: 'request', user_id: 3)
p3.save!

text4 = 'And Jesus said to them, “I am the bread of life. He who comes to Me shall never hunger, and he who believes in Me shall never thirst.'
p4 = Post.new(content: text4, testimonial: true, isPrivate: false, category: 'testimonial', user_id: 1)
p4.save!

text5 = 'And without controversy great is the mystery of godliness: God was manifested in the flesh, Justified in the Spirit, Seen by angels, Preached among the Gentiles, Believed on in the world, Received up in glory.'
p5 = Post.new(content: text5, testimonial: true, isPrivate: false, category: 'testimonial', user_id: 1)
p5.save!

text6 = 'Blessed is the man who trusts in the LORD, And whose hope is the LORD.'
p6 = Post.new(content: text6, request: true, isPrivate: false, category: 'request', user_id: 3)
p6.save!
