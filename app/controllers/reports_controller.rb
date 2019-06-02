class ReportsController < ApplicationController

  acts_as_token_authentication_handler_for User #authentication

  #GET /reports/getReportableType?reportable_type=REPORTABLE_TYPE "get reports by reportable_type"
  def getReportableType
    @reports = Report.where("reportable_type = ?", params[:reportable_type])
    render json: @reports
  end

  #GET all
  def index
    @reports = Report.all
    render json: @reports
  end
  #GET /report/:id
  def show
    @report = Report.find(params[:id])
    render json: @report
  end

  def new
    @report = Report.new
  end

  def report_params
    params.require(:reports).permit(:body, :reportable_id, :reportable_type)
  end
  #POST
  def create
    @report = Report.new(report_params)
    if @report.save
      render json: @report, status: :created, location: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def report_param
    params.require(:report).permit(:body, :reportable_id, :reportable_type)
  end
  #PATCH/PUT /report/1
  def update
    @report = Report.find(params[:id])

    if @report.update_attributes(report_param)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end
  #DELETE /report/1
  def destroy
    Report.find(params[:id]).destroy
  end
end
