class CodeLogController < ApplicationController
  def home
  end

  def get_repository
    system('mkdir repository')
    system('git clone https://github.com/M-Yamashita01/CodeLog.git repository')
    puts 'Finished clone repository.'
  end
end
