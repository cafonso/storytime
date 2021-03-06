module Storytime
  class Version < ActiveRecord::Base
    belongs_to :user, class_name: Storytime.user_class.to_s
    belongs_to :versionable, polymorphic: true
  end
end
