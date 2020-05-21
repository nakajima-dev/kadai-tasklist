# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..50).each do |num|
    user = User.first
    task = user.tasks.build(content: 'a'+num.to_s+'-t', status: 'a'+num.to_s+'-s')
    task.save
end