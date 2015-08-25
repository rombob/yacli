require 'thor'

module Yacli
  class Run < Thor
      
    def self.common_opts
      method_option :cmd, :aliases => "-r", :required => true
      method_option :'config-path', :aliases => "-c", :required => false
      method_option :'log-path', :aliases => "-l", :required => false
      method_option :'dry-run', :aliases => "-d", :type => :boolean, :default => false
    end
    
    desc "upload", "sync from local to s3"
    common_opts
    def upload
      require 's3rsync/sync'
      sync = Sync.new(options)
      exit sync.run(:upload)
    end
    
    desc "download", "sync from s3 to local"
    common_opts
    def download
      require 's3rsync/sync'
      sync = Sync.new(options)
      exit sync.run(:download)
    end
    
  end
  
end
