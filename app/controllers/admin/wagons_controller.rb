class Admin::WagonsController < Admin::BaseController
  before_action :set_train, only: [:index, :new, :create]
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = @train.wagons
  end

  def show
  end

  def new
    @wagon = @train.wagons.new
  end

  def create
    @wagon = @train.wagons.new(wagon_params)

    if @wagon.save
      redirect_to [:admin, @train]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to admin_wagon_path(@wagon)
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to admin_wagons_path
  end

  protected

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:number, :type, :upper_places, :lower_places, :side_upper_places, :side_lower_places, :sitting_places)
  end
end