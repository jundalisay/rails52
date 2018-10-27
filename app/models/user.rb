class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  has_one_attached :avatar

  
  include PgSearch
  pg_search_scope :search_by_details, against: [:name, :email], 
    using: {tsearch: {dictionary: "english"}}

  def gravatar_url(*args)
    options = args.extract_options!
    length = options.delete(:length) || 130
    hash = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{hash}.jpg?s=#{length}"
  end

end
