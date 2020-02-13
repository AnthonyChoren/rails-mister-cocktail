class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @coktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktail/show"
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
