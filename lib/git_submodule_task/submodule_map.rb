module GitSubmoduleTask
  class SubmoduleMap
    def initialize
      @submodules = {}
    end

    def push(submodule)
      @submodules[submodule.path] = submodule
    end

    def [](key)
      @submodules[key]
    end

    def each(&block)
      @submodules.values.each(&block)
    end
  end
end
