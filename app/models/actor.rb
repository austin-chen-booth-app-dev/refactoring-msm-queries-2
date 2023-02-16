# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  has_many(:characters, {
    :class_name => "Character",
    :foreign_key => "actor_id",
  })
  # def characters
  #   key = self.id

  #   the_many = Character.where({ :actor_id => key })

  #   return the_many
  # end

  has_many(:filmography, {
    :through => :characters,
    :source => :movie,
  })

  # This one returns all directors that are associated with movies that the actor is in
  # 1st hop: Get a list of character_ids associated with an actor_id
  # 2nd hop: Get a list of movie_ids associated with each character_id
  # 3rd hop: Get a list of directors associated with each movie

  has_many(:directors, { :through => :filmography, :source => :director })

  # def filmography
  #   the_many = Array.new

  #   self.characters.each do |joining_record|
  #     destination_record = joining_record.movie

  #     the_many.push(destination_record)
  #   end

  #   return the_many
  # end
end
