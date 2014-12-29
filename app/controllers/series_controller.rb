class SeriesController < ApplicationController
  before_action :set_series, only: [:show, :edit, :update, :destroy]

  def index
    @series = Series.all
  end

  def show
    @teams = @series.teams.joins(:players)
  end

  def new
    @series = Series.new
    2.times { @series.teams.build }
  end

  def create
    @series = Series.new(series_params)
    if @series.save
      redirect_to @series, notice: 'Series was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @series.update(series_params)
      redirect_to @series, notice: 'Series was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @series.destroy
      redirect_to series_index_url, notice: 'Series was deleted.'
    else
      redirect_to @series, notice: 'The series was not deleted.  Please try again later.'
    end
  end

  private
    def set_series
      @series = Series.find(params[:id])
    end

    def series_params
      params.require(:series).permit(
        :id,
        :name,
        teams_attributes: [
          :id,
          :_destroy,
          :name,
          :series
        ]
      )
    end
end
