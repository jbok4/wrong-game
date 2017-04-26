class Game < ApplicationRecord

has_many :photos, dependent: :destroy

end
