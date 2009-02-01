require 'rubygems'
require 'sinatra'
require 'faker'

# Seed it up...
srand(Time.now.to_i / (rand))

# Random prompts for whatever.
RANDOM_PROMPTS = ("Lunch today was
Obama said
___ days until vacation
I love
Confession: sometimes I
@___: you suck
Best iPhone app out is
So glad my name isn't ___
My favorite web app these days is ___
Guilty pleasure: I like to
I don't get why ___ is so popular
My (pet variety) just").split("\n")

# @levar_burton is awesome
ADJECTIVE_PROMPTS = ["a good neighbor", "a fun person", "grumpy", "smelly", "silly", "saucy", "happy", "cheerful", "mean", "dumb",
  "a poophead", "boring", "fuzzy", "burly", "dull", "deep", "so meta", "hip", "awesome"].map do |a|
  "@___ is #{a}"
end

# If my name was Gerard I'd punch myself in the face
name_prompts = []
30.times do
  name_prompts << "If my name was #{Faker::Name.first_name}"
end

# TV-oriented prompts
SHOWS = ["Lost", "BSG", "Heroes", "Gossip Girl", "Grey's Anatomy", "House", "The Office", "One Tree Hill", "American Idol", 
  "30 Rock", "24", "Fringe", "Ugly Betty", "90210", "Chuck", "Iron Chef", "Pokemon", "CSI", "Law &amp; Order"]

# Last time on Lost, something happened
LAST_TIME_PROMPTS = SHOWS.dup.map do |s|
  "Last time on #{s}"
end

# Next time on Iron Chef, I think Morimoto will pwn that n00b
NEXT_TIME_PROMPTS = SHOWS.dup.map do |s|
  "Next time on #{s} I think"
end

# Celebrities whom we will abuse
PEOPLE = ["Karl Marx", "Jesus", "Obama", "Isaac Newton", "Ghandi", "Confucius", "Aristotle", "Einstein", "Abe Lincoln", "Plato",
  "Che Guevara", "The Pope", "Beethoven", "Bach", "Handel", "Da Vinci", "Descartes", "Derrida", "Jefferson", "Washington",
  "GW Bush", "John Cleese", "Mickey Mouse", "JFK", "Mozart", "Elvis", "Disney", "John Lennon", "Van Gogh", "Picasso", "Edison",
  "Oprah", "Forrest Gump", "Dickens", "Freud", "Darth Vader", "Yoda", "Han Solo", "Chewbacca", "Charlie Brown", "Mr. Rogers", 
  "Liberace", "Yogi Bear", "Fred Flintstone", "Weird Al", "Julia Child"]

# The Pope's iTunes Library would include "Baby Got Back"
ITUNES_PROMPTS = PEOPLE.dup.map do |person|
  "#{person}'s iTunes Library includes"
end

# Oprah probably rocked at being awesome in high school
GOOD_PROMPTS = PEOPLE.dup.map do |person|
  "#{person} probably rocked at"
end

# Forrest Gump probably sucked at spelling
FAIL_PROMPTS = PEOPLE.dup.map do |person|
  "#{person} probably sucked at"
end

EXPERIENCES = ["food", "date", "school", "driving", "doctor", "work"]

# My worst food experience ever was eating off the sidewalk
BAD_EXPERIENCE_PROMPTS = EXPERIENCES.dup.map do |e|
  "My worst #{e} experience ever was"
end

# My best driving experience ever was when someone else did it
GOOD_EXPERIENCE_PROMPTS = EXPERIENCES.dup.map do |e|
  "My best #{e} experience ever was"
end

# Counts and things.  Obviously.
COUNTS = ["three", "four", "five", "six", "ten", "fifteen", "a hundred", "two dozen", "sixty", "a baker's dozen"]
THINGS = ["arms", "eyes", "dollars", "cats", "tacos", "computers", "Interwebs", "friends", "poops", "faces", "pizzas", "investors",
  "LOLCATS", "houses", "wives", "cars", "children", "TV channels", "books", "trees", "dolls", "pirates", "ninjas",
  "Twitter clients", "tweets", "e-mail addresses", "nipples"]

# I love books when they're actually good
LOVE_PROMPTS = THINGS.dup.map do |t|
  "I love #{t} when"
end

# I hate cats when they exist
HATE_PROMPTS = THINGS.dup.map do |t|
  "I hate #{t} when"
end

# If I had six arms I'd be Goro
personal_prompts = []
70.times do
  personal_prompts << "If I had #{COUNTS[rand(COUNTS.length)]} #{THINGS[rand(THINGS.length)]}"
end

# Man, a dozen pizzas would rock
rock_prompts = []
70.times do
  rock_prompts << "Man, #{COUNTS[rand(COUNTS.length)]} #{THINGS[rand(THINGS.length)]} would"
end

# I think my dog should quit eating my candy
I_THINK_PROMPTS = ["Obama", "America", "people", "hipsters", "punks", "pastries", "cops", "Macs", "my SO", "my boss", "my friends",
  "my parents", "publishers", "newspapers", "Simon Cowell", "Mariah Carey", "God", "my dog", "cookies", "traffic tickets",
  "meats", "food", "buckets", "LOLCATS", "LOLRUS", "pandas", "New Yorkers", "muffins", "hot dogs", "that guy"].map do |t|
    "I think #{t} should"
  end

# Build 'em all up
PROMPTS = ITUNES_PROMPTS + name_prompts + ADJECTIVE_PROMPTS + LAST_TIME_PROMPTS + NEXT_TIME_PROMPTS + BAD_EXPERIENCE_PROMPTS + GOOD_EXPERIENCE_PROMPTS + GOOD_PROMPTS + FAIL_PROMPTS + I_THINK_PROMPTS + LOVE_PROMPTS + HATE_PROMPTS + personal_prompts + rock_prompts + RANDOM_PROMPTS
puts "rolling with #{PROMPTS.length} prompts"

# Randomize again!!
srand(Time.now.to_i / (rand))

get '/' do
  @prompt = PROMPTS[rand(PROMPTS.length)]
  erb :main
end