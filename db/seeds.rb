@user1 = User.create!(name: 'user1', email: 'use222@mail.com', password: '123456')
@user2 = User.create!(name: 'user2', email: 'use252@mail.com', password: '123456')

@group1 = Group.create!(user: @user1, name: 'Food', icon: 'food-icon')
@group2 = Group.create!(user: @user1, name: 'Sports', icon: 'sport-icon')


@entity1 = Entity.create!(user: @user1,group:@group1, name: 'entity1', amount: 5)
@entity2 = Entity.create!(user: @user1,group:@group2 ,name: 'entity2', amount: 102)