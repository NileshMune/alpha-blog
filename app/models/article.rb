class Article < ActiveRecord::Base
  validates :title, presence: true, length: {minimum:3, maximum:10}
  validates :desc, presence:true, length: {minimum:10, maximum:300}
end