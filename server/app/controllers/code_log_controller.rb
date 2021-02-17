require 'open3'

class CodeLogController < ApplicationController
  def home
    # @repository_list
    home_path = Rails.root
    # File.dirname(home_path + '/'+ 'repository')
    repository_path = home_path.to_s + '/'+ 'repository/'
    Dir.glob(repository_path + '*') do |f|
      puts '----directory-------'
      puts f.to_s
    end
  end

  def get_repository
    repository_name = params[:repository]

    create_repository_dir_cmd = 'mkdir -p repository/code_log'
    execute_cmd(create_repository_dir_cmd)
    clone_repository_cmd = "git clone #{repository_name} repository"
    execute_cmd(clone_repository_cmd)

    redirect_to('/code_log/home')
  end

  private

  def execute_cmd(cmd)
    stdout, stderr, status = Open3.capture3(cmd)
    p stdout
    p stderr
    p status
  end

end
