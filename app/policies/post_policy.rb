class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def initialize(user, post)
    super
    @user = user
    @post = post
  end

  def index?
    true
  end

  def destroy?
    return true if @post.user == @user
  end

  def edit?
    return true if @post.user == @user
  end

  def update?
    return true if @post.user == @user
  end

  def new?
    return true if @user.present?
  end
end
