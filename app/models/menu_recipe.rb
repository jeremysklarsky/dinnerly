class MenuRecipe < ActiveRecord::Base

  belongs_to :menu
  belongs_to :recipe
  belongs_to :chef, :class_name => "User"
  has_many :votes, dependent: :destroy

  def vote_total
    votes.size
  end

  def vote_cast?(current_user)
    !self.votes.where(:user_id => current_user.id).empty?
  end

  def is_chef?(current_user)
    if self.chef
      self.chef.id == current_user.id
    else
      false
    end
  end

end
