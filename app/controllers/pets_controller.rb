class PetsController < ApplicationController
  def index
    @pets = Pet.where(user_id: current_user.id)
  end

  def new
    @pet = Pet.new
  end

  def show
    @pet = Pet.find(params[:id])
    @pet.create_a_month_records(params[:start_date])

    @records = @pet.records
    @user = @pet.user_id
    plan = Record
      .where('start_time >= ?', Date.current)
      .where(content_type: 1)
      .where(pet_id: @pet)
      .order(:start_time)
      .first
    # 三項演算 ( 式 ? trueの処理 : falseの処理 )
    @plan_day = plan.present? ? (plan.start_time.to_date - Date.current).to_i : nil
    #logger.info(@plan_day)
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    if @pet.save
      redirect_to pets_path
    else
      render 'new'
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      flash[:success] = "ペットが編集されました！"
      redirect_to user_path(current_user.id)
    else
      render 'edit'
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    if @pet.destroy
    flash[:success] = "ペットを削除しました"
    redirect_to user_path(current_user.id)
    end
  end

  private
  def pet_params
      params.require(:pet).permit(:name, :user_id, :pet_image)
  end
end
