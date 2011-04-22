set :application, "booksoul"

set :rails_env, :production
set :deploy_to, "/home/heartme/booksoul"
set :deploy_via, :remote_cache

set :scm, :git
set :repository,  "git@github.com:kkxlkkxllb/booksoul.git"
set :branch, "master"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "root@173.255.251.67"                          # Your HTTP server, Apache/etc
role :app, "root@173.255.251.67"                          # This may be the same as your `Web` server
#role :db,  "root@173.255.251.67", :primary => true # This is where Rails migrations will run

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end