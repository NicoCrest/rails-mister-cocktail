class DosesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktail_path(@cocktail), notice: 'Dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
