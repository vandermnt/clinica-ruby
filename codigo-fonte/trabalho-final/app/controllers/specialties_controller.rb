class SpecialtiesController < ApplicationController
  before_action :set_specialty, only: [:show, :edit, :update, :destroy]

  # GET /specialties
  # GET /specialties.json
  def index
    @specialties = Specialty.all
  end

  # GET /specialties/1
  # GET /specialties/1.json
  def show
  end

  # GET /specialties/new
  def new
    @specialty = Specialty.new
  end

  # GET /specialties/1/edit
  def edit
  end

  # POST /specialties
  # POST /specialties.json
  def create
    @specialty = Specialty.new(specialty_params)

    respond_to do |format|
      if @specialty.save
        format.html { redirect_to @specialty, notice: 'Especialidade cadastrada com sucesso.' }
        format.json { render :show, status: :created, location: @specialty }
      else
        format.html { render :new }
        format.json { render json: @specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specialties/1
  # PATCH/PUT /specialties/1.json
  def update
    respond_to do |format|
      if @specialty.update(specialty_params)
        format.html { redirect_to @specialty, notice: 'Especialidade alterada com sucesso.' }
        format.json { render :show, status: :ok, location: @specialty }
      else
        format.html { render :edit }
        format.json { render json: @specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialties/1
  # DELETE /specialties/1.json
  def destroy
    @especialista = Specialist.where("specialty_id = ?", @specialty["id"])

    @especialista.each do |especialista|
      if especialista!=nil
        redirect_to specialties_path, flash: { error: "Não foi possível excluir especialidade, pois a mesma possui especialistas vinculados." }
        return
      end
    end

    @specialty.destroy
    respond_to do |format|
      format.html { redirect_to specialties_url, notice: 'Especialidade deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specialty
      @specialty = Specialty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specialty_params
      params.require(:specialty).permit(:name)
    end
end
