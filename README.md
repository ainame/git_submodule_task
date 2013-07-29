# GitSubmoduleTask

git_submodule_task provide the internal DSL to write tasks for git submodule.

## Installation

    $ git clone git@github.com:ainame/git_submodule_task.git
	$ cd git_submodule_task
	$ gem build git_submodule_task.gemspec
	$ gem install git_submodule_task-0.0.1.gem

## Usage

1. install gem
2. create `Submodulefile` on project's root directory
3. write the task on it.

for example
```ruby
require 'git_submodule_task/dsl'

submodule 'library/ActionBarSherlock' do |sm|
  # force reset to update...
  sm.execute "git reset HEAD --hard"

  # pull from original source
  sm.execute "git pull github master"

  # commit to parent repository
  sm.parent.commit("[submodule] update #{sm.repo_path}\"") 

  # reflect to remote of submodule
  sm.execute "git push origin master"

  # commit to remote parent repository
  sm.parent.push('origin', sm.parent.current_branch)
end
```
4. Then, execute `submodule_update SUBMODULE_PATH`, git_submodule_task execute that task.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
