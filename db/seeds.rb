# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 1件ずつ記述
user = User.create(email: "user1@test.co.jp", password: "passUser1")
Task.create(title: "0.タスク0", user_id: user.id)

# まとめて記述
10.times do |i|
    Task.create(title: "#{i+1}. タスク#{i+1}", user_id: user.id)
end
