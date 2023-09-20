class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # 全てのモデルに対して新着商品を降順に並べるために必要
   scope :latest, -> { order(created_at: :desc) }
end
