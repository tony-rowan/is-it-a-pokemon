class Question < ApplicationRecord
  def real?
    @real ||= Pokemon.exists?(name: name)
  end
end
