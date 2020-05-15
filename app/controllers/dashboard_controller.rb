class DashboardController < ApplicationController
  before_action :set_path
  layout 'application'#, only: [:index, :file]


  def index
    # self.content_type = 'application/html'
    # params[:format] = 'html'
    @file_data = File.readlines(@path)
    # render :file, content_type: "application/html"
    # layout 'application'
    # render 'file', formats: :html
    render 'file',formats: :html, layout: 'application'

    # respond_to do |format|
    #   format.html {render :index}
    #   # format.xml { render :xml => @people.to_xml }
    # end

  # 如果檔名無法開啟，就用目錄開啟
  rescue Errno::EISDIR
    Dir.entries(@path)
    set_directory
    # byebug
    render :index, formats: :html
  end


  private

  def set_directory
    @files = []
    @dirs = []

    # 設定目錄
    Dir.entries(@path).each do |dir|
      @dirs << "#{@path}/#{dir}" unless File.file?(dir)
    end

    # 設定檔案
    Dir.entries(@path).each do |file|
      @files << file if File.file?(file)
    end
  end

  def set_path
    @path = request.original_fullpath
    @path[0] = ''
    @path = '.' if @path == ''
  end
end
