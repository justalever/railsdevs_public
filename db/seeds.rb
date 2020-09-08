# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Characte#r.create(name: 'Luke', movie: movies.first)

User.delete_all
Job.delete_all

admin = User.new(email: "andy@web-crunch.com", password: "password", password_confirmation: "password", admin: true, developer: true, employer: true)
admin.skip_confirmation!
admin.save

developer = User.new(email: "developer@web-crunch.com", password: "password", password_confirmation: "password", admin: false, developer: true, employer: false)
developer.skip_confirmation!
developer.save

employer = User.new(email: "employer@web-crunch.com", password: "password", password_confirmation: "password", admin: false, developer: false, employer: true)
employer.skip_confirmation!
employer.save

Job.create!(
  id: 1,
  company_name: "Google",
  company_website: "https://google.com",
  compensation_range: "170,000 - 180,000",
  compensation_type: "Full-time",
  estimated_hours: nil,
  featured: false,
  featured_until: nil,
  headquarters: "California",
  link_to_apply: "https://google.com/apply",
  price: 199,
  published_at: DateTime.now,
  remote: false,
  slug: "rails-developer-at-google",
  status: "published",
  title: "Rails developer at Google",
  upsell_type: nil,
  years_of_experience: "5",
  user_id: admin.id,
  description: Faker::Hipster.paragraph,
  company_description: Faker::Hipster.paragraph
)

Job.create!(
  id: 2,
  company_name: "Dropbox",
  company_website: "https://dropbox.com",
  compensation_range: nil,
  compensation_type: "Contract",
  estimated_hours: "more than 100",
  featured: true,
  featured_until: 1.week.from_now.beginning_of_day,
  headquarters: "California",
  link_to_apply: "https://dropbox.com/apply",
  price: 299,
  published_at: DateTime.now,
  remote: true,
  slug: "ruby-developer-at-dropbox",
  status: "published",
  title: "Ruby developer at Dropbox",
  upsell_type: "best",
  years_of_experience: "5",
  user_id: employer.id,
  description: Faker::Hipster.paragraph,
  company_description: Faker::Hipster.paragraph
)

Job.create!(
  id: 3,
  company_name: "Apple",
  company_website: "https://apple.com",
  compensation_range: "240,000 - 250,000",
  compensation_type: "Full-time",
  estimated_hours: nil,
  featured: false,
  featured_until: nil,
  headquarters: "California",
  link_to_apply: "https://apple.com/apply",
  price: 199,
  published_at: DateTime.now,
  remote: false,
  slug: "ruby-developer-at-apple",
  status: "published",
  title: "Ruby developer at Apple",
  upsell_type: nil,
  years_of_experience: "8",
  user_id: employer.id,
  description: Faker::Hipster.paragraph,
  company_description: Faker::Hipster.paragraph
)