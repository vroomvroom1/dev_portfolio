#controller portfolio items, standard CRUD functions. Most can be generated

class PortfoliosController < ApplicationController
  before_action :show_portfolio_item, only: [:edit, :show, :update, :destroy]
  layout 'portfolio'

  def index
    @portfolio_items = Portfolio.all
  end

  def React
    @React_portfolio_items = Portfolio.React
  end

#creates instance of Portfolio item
  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

#actually creates custom item
  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

#edit function opens form
  def edit
  end

#actually updates db
  def update

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

#link to page with portfolio information
  def show
  end

#delete fuction
  def destroy
    #deletes item
    @portfolio_item.destroy

    #redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio item was successfully deleted.' }
    end
  end

  def show_portfolio_item
    #looks up item
    @portfolio_item = Portfolio.find(params[:id])
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
  end

end
