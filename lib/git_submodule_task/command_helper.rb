module GitSubmoduleTask
  module CommandHelper
    def execute(command = "")
      with_specific_dir(self.path) do
        puts "[command]: #{command}"
        `#{command}`
      end
    end

    def root_dir
      root = `git rev-parse --show-cdup`.chomp
      root = './' if root.empty?
      root
    end

    def with_specific_dir(dir, &block) 
      puts "[chdir]: #{dir}"
      Dir.chdir(dir) do
        block.call
      end
    end

    def submodule_list
      submodule_result = execute "git submodule"
      submodule_result.split("\n").map {|line| line.split[1] }
    end

    def commit(message)
      execute "git commit -m \"#{message}\""
    end

    def push(remote = "origin", branch = "master")
      execute "git push #{remote} #{branch}"
    end

    def current_branch
      branch = `git branch`.split("\n")[0].chomp.split[1]
    end
  end
end
