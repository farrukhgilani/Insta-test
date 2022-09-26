class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def initialize(user, comment)
    super
    @user = user
    @comment = comment
  end

  def destroy?
    return true if @comment.user == @user
  end
end
