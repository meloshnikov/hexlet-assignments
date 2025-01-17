class Task < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true
  validates :creator, presence: true
  validates :completed, inclusion: { in: [true, false] }

  def self.generate_fake_task
    Task.create(
      name: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      status: "new",
      creator: Faker::Name.name,
      performer: Faker::Name.name,
      completed: Faker::Boolean.boolean
    )
  end
end
