class ExercisesController < ApplicationController
    def new
        @training = Training.find(params[:training_id])
        @exercise = @training.exercises.new
    end

    def create
        @training = Training.find(params[:training_id])
        @exercise = @training.exercises.new(exercise_params)
        if @exercise.save
            redirect_to training_path(@training), notice: 'Ejercicio añadido con éxito.'
        else
            render :new, alert: 'Error al añadir el ejercicio.'
        end
    end

    private

    def exercise_params
        params.require(:exercise).permit(:name, :sets, :reps, :weight)
    end
end
