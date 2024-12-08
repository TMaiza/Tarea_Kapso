class Training < ApplicationRecord
    has_many :exercises, dependent: :destroy
    validates :name, presence: true

    #Para calcular el volumen del la suma de los ejercicios
    def volumen_total
        exercises.sum { |exercise| exercise.volumen_total }
    end

    def peso_maximo_levantado
        exercises.maximum(:weight) || 0
    end

    def self.ordered_by_volume
        all.sort_by(&:volumen_total).reverse
    end
end
