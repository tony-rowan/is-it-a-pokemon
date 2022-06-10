# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

generated_names = File.readlines(Rails.root.join("config/data/generated_names.txt"), chomp: true)
actual_names = File.readlines(Rails.root.join("config/data/actual_names.txt"), chomp: true)

generated_names.each { |name| Question.create!(name: name) }
actual_names.each { |name| Pokemon.create!(name: name) }
