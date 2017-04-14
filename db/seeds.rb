user_list = [
  ["sassypantofle", "sissessemma-9062@yopmail.com", "2YyUbNHD"],
  ["pinchdrugged", "uhovyji-4279@yopmail.com", "FPc5qdNy"]
]

user_list.each do |user|
  User.create(username: user[0], email: user[1], password: user[2])
end

house_list = [
  ["196 Woodside Circle Mobile, FL 36602", 1],
  ["3756 Preston Street Wichita, KS 67213", 2],
]

house_list.each do |house|
  House.create(address: house[0], user_id: house[1])
end

parent_list = [
  ["Nick k Shoults", 1],
  ["fanny s. shoults", 1],
  ["Julia Talmage", 2]
]

parent_list.each do |parent|
  Parent.create(name: parent[0], house_id: parent[1])
end

child_list = [
  ["Bill", 7],
  ["jill", 14],
  ["Dorothy", 5],
  ["Leandra", 14],
  ["Edward", 0]
]

child_list.each do |child|
  Child.create(name: child[0], age: child[1])
end
