class DisciplinasController < ApplicationController
  before_action :set_disciplina, only: %i[ show edit update destroy ]
  before_action :set_turmas, only: %i[ new create edit update ]
  before_action :authorized, only: %i[ index show new edit create update destroy]

  # GET /disciplinas or /disciplinas.json
  def index
    @disciplinas = Disciplina.all.where('user_id = ?', current_user.id)
  end

  # GET /disciplinas/1 or /disciplinas/1.json
  def show
  end

  # GET /disciplinas/new
  def new
    @disciplina = Disciplina.new
  end

  # GET /disciplinas/1/edit
  def edit
  end

  # POST /disciplinas or /disciplinas.json
  def create
    params = {'user_id':current_user.id}.merge(disciplina_params)
    @disciplina = Disciplina.new(params)

    respond_to do |format|
      if @disciplina.save
        format.html { redirect_to @disciplina, notice: "Disciplina was successfully created." }
        format.json { render :show, status: :created, location: @disciplina }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @disciplina.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disciplinas/1 or /disciplinas/1.json
  def update
    respond_to do |format|
      if @disciplina.update(disciplina_params)
        format.html { redirect_to @disciplina, notice: "Disciplina was successfully updated." }
        format.json { render :show, status: :ok, location: @disciplina }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @disciplina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplinas/1 or /disciplinas/1.json
  def destroy
    @disciplina.destroy
    respond_to do |format|
      format.html { redirect_to disciplinas_url, notice: "Disciplina was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disciplina
      disciplina = Disciplina.find(params[:id])
      if disciplina.user_id == current_user.id
        @disciplina = disciplina
      else
        redirect_to disciplinas_path
      end
    end

    def set_turmas
      @turmas = Turma.all.map{ |turma| [turma.ano.to_s + "º-" + turma.letra.to_s + "-" + turma.anoLetivo.to_s, turma.id]}
    end

    # Only allow a list of trusted parameters through.
    def disciplina_params
      params.require(:disciplina).permit(:nome, :anoLetivo, :turma_id, :user_id)
    end
end
