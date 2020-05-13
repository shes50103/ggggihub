class DashboardController < ApplicationController

  before_action :set_path

  def index
    @file_data = File.readlines(@path)
    render :file

  # 如果檔名無法開啟，就用目錄開啟
  rescue Errno::EISDIR
    Dir.entries(@path)
    set_directory
    render :index
  end


  private

  def set_directory
    @files = []
    @dirs = []

    # 設定目錄
    Dir.entries(@path).each do |dir|
      @dirs << "#{@path}/#{dir}" unless File.file?(@path+"/"+dir)
    end

    # 設定檔案
    Dir.entries(@path).each do |file|
      @files << "#{@path}/#{file}" if File.file?(@path+"/"+file)
    end
  end

  def set_path
    @path = request.original_fullpath
    @path[0] = ''
    @path = '.' if @path == ''
  end
end
