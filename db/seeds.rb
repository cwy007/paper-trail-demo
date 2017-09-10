# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Article.delete_all

User.create(email: "admin@gmail.com", password: "12345678")

puts "新建一个用户: email: 'admin@gmail.com', password: '12345678'"

10.times do |i|
  Article.create(title: "tilte#{i}", content: "The best way to diff adjacent versions is to get PaperTrail to do it for you. If you add an object_changes text column to your versions table, either at installation time with the rails generate paper_trail:install --with-changes option or manually, PaperTrail will store the changes diff (excluding any attributes PaperTrail is ignoring) in each update version. You can use the version.changeset method to retrieve it.")
end
puts "新建10篇articles"
