class AtividadesController < ApplicationController
  before_action :set_atividade, only: %i[ show edit update destroy ]
  before_action :set_disciplinas, only: %i[ new create edit update ]
  before_action :authorized, only: %i[ index show new edit create update destroy]

  # GET /atividades or /atividades.json
  def index
    @atividades = Atividade.all
    unless :bimestre.nil?
      @atividades = Atividade.by_bimestre(params[:bimestre]).all
    end
    puts ("Parametros " + params.to_s)
    respond_to do |format|
     format.html # index.html.erb
     format.json { render json: @atividades}
    end
  end

  # GET /atividades/1 or /atividades/1.json
  def show
  end

  # GET /atividades/new
  def new
    @atividade = Atividade.new
  end

  # GET /atividades/1/edit
  def edit
  end

  # POST /atividades or /atividades.json
  def create
    @atividade = Atividade.new(atividade_params)

    respond_to do |format|
      if @atividade.save
        format.html { redirect_to @atividade, notice: "Atividade was successfully created." }
        format.json { render :show, status: :created, location: @atividade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atividades/1 or /atividades/1.json
  def update
    respond_to do |format|
      if @atividade.update(atividade_params)
        format.html { redirect_to @atividade, notice: "Atividade was successfully updated." }
        format.json { render :show, status: :ok, location: @atividade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atividades/1 or /atividades/1.json
  def destroy
    @atividade.destroy
    respond_to do |format|
      format.html { redirect_to atividades_url, notice: "Atividade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atividade
      disciplinas = current_user.disciplinas
      disciplinas.each do |disciplina|
        @atividade = disciplina.atividades.find(params[:id])
        unless @atividade.nil?
          break
        end
      end
    end

    def set_disciplinas
      @disciplinas = Disciplina.all.map{ |c| [c.nome.to_s + "-" + c.anoLetivo.to_s + "-" + c.turma_id.to_s, c.id]}
    end

    # Only allow a list of trusted parameters through.
    def atividade_params
      params.require(:atividade).permit(:titulo, :descricao, :bimestre, :data, :disciplina_id)
    end

  #def atividade_params_index
  # params.require(:atividade).permi(:bimestre)
  #end
end
