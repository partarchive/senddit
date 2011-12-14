# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'factory_girl'

module Seeds
  class SamplePosts
    def self.run
      25.times do |n|
        post = Factory(:post)
      end
    end
  end
end

Seeds::SamplePosts.run
