require 'fog'
require "iamfindbykey/version"

module EverTools
  class IamFindByKey

    def initialize(args)
      @args = args
      @key = args[0]
    end

    def run
      display('ID', user.id)
      display('Path', user.path)
      display('ARN', user.arn)
      display('Created', user.created_at)
    end

    private

    def display(key, value)
      puts "#{key}: #{value}"
    end

    def user
      @user ||= begin
        r = connection.users.find { |u| u.user_id == @key }
        if r.nil?
          puts "Key #{@key} not found"
          exit 1
        end
        r
      end
    end

    def connection
      @connection ||= Fog::AWS::IAM.new
    end
  end
end
