module GitSubmoduleTask
  class ParentRepository
    include CommandHelper

    attr_reader :path

    def initialize(path)
      @path = path
    end
  end
end
