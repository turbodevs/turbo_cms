class Page < ActiveRecord::Base

belongs_to :parent, class_name: :Page, foreign_key: :parent_id
has_many :children, class_name: :Page, foreign_key: :parent_id

validates :title, presence: true, 
                  uniqueness: true, 
                  length: { in: 3..50 }
validates :position, presence: true, 
                  numericality: { only_integer: true }
validates :content, :parent_id, presence: true

end
