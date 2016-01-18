require 'csv'
require 'calbee'

class HomeController < ApplicationController
  def index
  end

  def upload
    file = params[:file]
    unless file
      redirect_to :root
      return
    end
    respond_to do |format|
      data = ""
      format.vcf do
        CSV.foreach(file.path) do |row|
          data += Calbee.new(row[0], row[0]).to_s
        end
        render :text => data
      end
    end
  end

end
