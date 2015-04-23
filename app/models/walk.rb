# == Schema Information
#
# Table name: walks
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  dates      :jsonb
#  languages  :jsonb
#  user_lang  :string           default("en")
#  flow       :hstore
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Walk model class
class Walk < ActiveRecord::Base
  before_create :add_create_flow
  after_create :inform_greeters, :email_details

  validates :name, :email, :dates, :languages, presence: true
  validates :email, email: true
  validates :languages, languages_json_schema: true
  validates :dates, dates_json_schema: true

  def add_flow(message)
    flow[Time.new.to_s] = message
  end

  private

  def add_create_flow
    self.flow = { Time.new.to_s => 'Created new application by api request.' }
  end

  def inform_greeters
    WalkMailer.inform(self).deliver_now
    HipchatJob.perform_later(self)
  end

  def email_details
    WalkMailer.details(self).deliver_now
  end
end