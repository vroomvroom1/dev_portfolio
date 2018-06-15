#controller portfolio items, standard CRUD functions. Most can be generated

class PortfoliosController < ApplicationController
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
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

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
    @portfolio_item = Portfolio.find(params[:id])
  end

#actually updates db
  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Portfolio Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

#link to page with portfolio information
  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

#delete fuction
  def destroy
    #looks up item
    @portfolio_item = Portfolio.find(params[:id])

    #deletes item
    @portfolio_item.destroy

    #redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio item was successfully deleted.' }
    end
  end



end
