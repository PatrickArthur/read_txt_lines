class LinesController < ApplicationController

  before_action :import_csv, only: [:index, :show]

  def index
    @search_results = {}
    @file.each do |k,v|
      if k == params[:keywords].to_i
        @search_results[k]=v
      elsif params[:keywords].nil?
        @search_results = nil
      end
    end
  end

  def show
    @line = @file[params[:id].to_i]
    if @line.present?
      @status = "202"
      render :status => 202
    else
      @status = "413"
      render :status => 413
    end
  end

  private

  def import_csv
    @file = {}
    line = 0
    @test = File.foreach(ENV["FILE_TO_SERVE"]).map { |line| line.split('\n') }
    @test[0].each do |x|
      @file[line+=1]=x
    end
  end
end
