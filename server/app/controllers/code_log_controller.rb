require 'open3'

class CodeLogController < ApplicationController
  def home
    # @repository_list
    home_path = Rails.root
    # File.dirname(home_path + '/'+ 'repository')
    repository_path = home_path.to_s + '/'+ 'repository/'
    repository_path = Rails.root.join('repository', '*', '*')
    @repository_list = Dir.glob(repository_path)
  end

  def get_repository
    repository_name = params[:repository]
    repository_name_array = repository_name.split('/')
    project_name = repository_name_array.last
    organization_name = repository_name_array[repository_name_array.length - 2]

    logger.info("organization name: #{organization_name}, project name: #{project_name}")

    checkout_path = "repository/#{organization_name}/#{project_name}"
    create_repository_dir_cmd = "mkdir -p #{checkout_path}"
    execute_cmd(create_repository_dir_cmd)
    clone_repository_cmd = "git clone #{repository_name} #{checkout_path}"
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
