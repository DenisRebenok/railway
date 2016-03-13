class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def show
    @stations = @route.railway_stations
    @trains = @route.trains
  end

  def new
    @route = Route.new
  end

  def edit
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      redirect_to [:admin, @route], notice: "Путь успешно создан."
    else
      render :new
    end
  end

  def update
    if @route.update(route_params)
      redirect_to [:admin, @route], notice: "Путь успешно изменен."
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_path, notice: "Путь успешно удален."
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:title)
  end
end
