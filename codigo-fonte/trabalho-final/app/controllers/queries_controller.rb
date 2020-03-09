class QueriesController < ApplicationController
  before_action :set_query, only: [:show, :edit, :update, :destroy]

  # GET /queries
  # GET /queries.json
  def index
    @queries = Query.all
  end

  # GET /queries/1
  # GET /queries/1.json
  def show
  end

  # GET /queries/new
  def new
    @query = Query.new
  end

  # GET /queries/1/edit
  def edit
  end

  def escolherPacienteAgenda
    @patients = Patient.all
    @patients = Patient.new
  end

  def visualizarAgendaPaciente
    @p = params[:paciente]
    @agenda_paciente = Query.where("patient_id = ?", @p["id"])
    @agendapaciente = Query.new
  end

  # POST /queries
  # POST /queries.json
  def create
    @query = Query.new(query_params)

    @dataHora_escolhida = @query.date
    @especialista_escolhido = @query.specialist["id"]

    #verifica se já tem consulta na mesma data e hora, com o mesmo especialista
    @horarioDisponivel = Query.where("date = ?", @dataHora_escolhida).where("specialist_id = ?", @especialista_escolhido)

    @horarioDisponivel.each do |horario_disponivel|
      if horario_disponivel!=nil
        redirect_to queries_path, flash: { error: "Não foi possível agendar consulta, horário indiponível. Consulte a agenda." }
        return
      end
    end

    respond_to do |format|
      if @query.save
        format.html { redirect_to @query, notice: 'Consulta agendada com sucesso.' }
        format.json { render :show, status: :created, location: @query }
      else
        format.html { render :new }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /queries/1
  # PATCH/PUT /queries/1.json
  def update
    respond_to do |format|
      if @query.update(query_params)
        format.html { redirect_to @query, notice: 'Consulta atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @query }
      else
        format.html { render :edit }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queries/1
  # DELETE /queries/1.json
  def destroy
    @query.destroy
    respond_to do |format|
      format.html { redirect_to queries_url, notice: 'Consulta deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_query
    @query = Query.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def query_params
    params.require(:query).permit(:date, :status, :note, :patient_id, :specialist_id)
  end
end
