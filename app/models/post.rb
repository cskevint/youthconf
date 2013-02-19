class Post < ActiveRecord::Base
  attr_accessible :content,
                  :promoted

  belongs_to :conference
  belongs_to :user

  belongs_to :parent, :class_name => 'Post'
  has_many :comments, :class_name => 'Post', :foreign_key => 'parent_id'

  def self.create_and_link(content, user, conference)
    post = Post.create(content: content)
    user.posts.push(post)
    conference.posts.push(post)
    post
  end
end
