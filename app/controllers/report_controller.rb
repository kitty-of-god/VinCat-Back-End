class ReportController < ApplicationController
  def list
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  def report_params
    params.require(:reports)
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def report_param
    params.require(:report)
  end

  def update
    @report = Report.find(params[:id])

    if @report.update_attributes(book_param)
      redirect_to :action => 'show', :id => @report
    end
  end

  def delete
    Report.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
