require 'git_submodule_task/command_helper'
require 'git_submodule_task/parent_repository'

module GitSubmoduleTask
  class SubmoduleRepository
    include CommandHelper

    attr_reader :path, :updater, :parent

    def initialize(path, &block)
      @path    = path
      @updater = block
      @parent  = GitSubmoduleTask::ParentRepository.new(root_dir)
    end

    def update
      @updater.call(self)
    end
  end
end
