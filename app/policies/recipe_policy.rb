class RecipePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.includes(:ingredients)
    end
  end
end
