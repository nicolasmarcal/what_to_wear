class Person < ActiveRecord::Base
  attr_accessible :email,
                  :first_name,
                  :gender,
                  :image,
                  :last_name,
                  :nick_name,
                  :oauth_expires_at,
                  :oauth_token,
                  :uid

  scope :by_uid, lambda { |uid| where(:uid => uid) }

  def self.find_or_create_person(options)
    self.by_uid(options.uid).first_or_initialize.tap do |person|
      person.email = options.extra.raw_info.email
      person.first_name = options.extra.raw_info.first_name
      person.gender = options.extra.raw_info.gender
      person.image = options.extra.raw_info.email
      person.last_name = options.extra.raw_info.last_name
      person.nick_name = options.info.nick_name
      person.oauth_expires_at = Time.at(options.credentials.expires_at)
      person.oauth_token = options.credentials.token
      person.uid = options.uid

      person.save!
    end
  end
end
