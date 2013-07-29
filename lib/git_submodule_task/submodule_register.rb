require 'git_submodule_task/submodule_map'
require 'git_submodule_task/submodule_repository'

module GitSubmoduleTask
  module SubmoduleRegister
    def submodules
      @@submodules ||= SubmoduleMap.new
    end
    module_function :submodules

    def submodule(path, &updater)
      sub = SubmoduleRepository.new(path, &updater)
      submodules.push(sub)
    end
  end
end
