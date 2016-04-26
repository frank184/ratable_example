require 'pp'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: '.yellow << user.email.to_s.green


posts = Array.new

posts.push(
  Post.new(
    title: "Man must explore, and this is exploration at its greatest",
    description: "Problems look mighty small from 150 miles up",
    content: "Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center — an equal earth which all men occupy as equals. The airman's earth, if free men make it, will be truly round: a globe in practice, not in theory. Science cuts two ways, of course; its products can be used for both good and evil. But there's no turning back from science. The early warnings about technological dangers also come from science. What was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth. A Chinese tale tells of some men sent to harm a young girl who, upon seeing her beauty, become her protectors rather than her violators. That's how I felt seeing the Earth for the first time. I could not help but love and cherish her. For those who have seen the Earth from space, and for the hundreds and perhaps thousands more who will, the experience most certainly changes your perspective. The things that we share in our world are far more valuable than those which divide us.",
    user: user
  )
)
posts.push(
  Post.new(
    title: "I believe every human has a finite number of heartbeats. I don't intend to waste any of mine.",
    content: "Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center — an equal earth which all men occupy as equals. The airman's earth, if free men make it, will be truly round: a globe in practice, not in theory. Science cuts two ways, of course; its products can be used for both good and evil. But there's no turning back from science. The early warnings about technological dangers also come from science. What was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth. A Chinese tale tells of some men sent to harm a young girl who, upon seeing her beauty, become her protectors rather than her violators. That's how I felt seeing the Earth for the first time. I could not help but love and cherish her. For those who have seen the Earth from space, and for the hundreds and perhaps thousands more who will, the experience most certainly changes your perspective. The things that we share in our world are far more valuable than those which divide us.",
    user: user
  )
)
posts.push(
  Post.new(
    title: "Science has not yet mastered prophecy",
    description: "We predict too much for the next year and yet far too little for the next ten.",
    content: "Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center — an equal earth which all men occupy as equals. The airman's earth, if free men make it, will be truly round: a globe in practice, not in theory. Science cuts two ways, of course; its products can be used for both good and evil. But there's no turning back from science. The early warnings about technological dangers also come from science. What was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth. A Chinese tale tells of some men sent to harm a young girl who, upon seeing her beauty, become her protectors rather than her violators. That's how I felt seeing the Earth for the first time. I could not help but love and cherish her. For those who have seen the Earth from space, and for the hundreds and perhaps thousands more who will, the experience most certainly changes your perspective. The things that we share in our world are far more valuable than those which divide us.",
    user: user
  )
)
posts.push(
  Post.new(
    title: "Failure is not an option",
    description: "Many say exploration is part of our destiny, but it’s actually our duty to future generations.",
    content: "Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center — an equal earth which all men occupy as equals. The airman's earth, if free men make it, will be truly round: a globe in practice, not in theory. Science cuts two ways, of course; its products can be used for both good and evil. But there's no turning back from science. The early warnings about technological dangers also come from science. What was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth. A Chinese tale tells of some men sent to harm a young girl who, upon seeing her beauty, become her protectors rather than her violators. That's how I felt seeing the Earth for the first time. I could not help but love and cherish her. For those who have seen the Earth from space, and for the hundreds and perhaps thousands more who will, the experience most certainly changes your perspective. The things that we share in our world are far more valuable than those which divide us.",
    user: user
  )
)

posts.each do|post|
  puts 'CREATING POST:'.yellow
  pp post
  saved = post.save
  puts saved ? "Saved!".light_green : "Didn't Save!".red
  if saved
    puts 'CREATING RATINGS'.yellow
    n = (1..10).to_a.sample
    n.times do
      rater = [user, nil].sample
      value = (1..5).to_a.sample
      pp post.rate(rater: rater, value: value)
      sleep 0.5
    end
  end
end
