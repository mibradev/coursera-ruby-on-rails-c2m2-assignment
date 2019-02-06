require "securerandom"

User.destroy_all
due_date = 1.year.from_now

profiles = [
  { gender: "female", birth_year: 1954, first_name: "Carly", last_name: "Fiorina" },
  { gender: "male", birth_year: 1946, first_name: "Donald", last_name: "Trump" },
  { gender: "male", birth_year: 1951, first_name: "Ben", last_name: "Carson" },
  { gender: "female", birth_year: 1947, first_name: "Hillary", last_name: "Clinton" }
]

profiles.each do |profile|
  user = User.create! username: profile[:last_name], password_digest: SecureRandom.base64(8)
  user.create_profile! profile
  todo_list = user.todo_lists.create! list_due_date: due_date
  todo_items = []
  5.times { todo_items << { due_date: due_date, title: SecureRandom.hex(5), description: SecureRandom.hex(10) } }
  todo_list.todo_items.create! todo_items
end
