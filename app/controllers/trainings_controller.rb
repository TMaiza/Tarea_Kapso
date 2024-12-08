class TrainingsController < ApplicationController
    def index
        @trainings = if params[:order] == 'volume'
                        Training.ordered_by_volume
                    else
                        Training.all
                    end
    end

    def new
        @training = Training.new
    end

    def create
        @training = Training.new(training_params)
        if @training.save
            redirect_to trainings_path, notice: 'Entrenamiento creado con éxito.'
        else
            render :new, alert: 'Error al crear el entrenamiento.'
        end
    end

    def show
        @training = Training.find(params[:id])
        @exercises = @training.exercises
    end
    
    private

    def training_params
        params.require(:training).permit(:name)
    end
end
