# frozen_string_literal: true

require 'daemon_spawn'

class TestService < DaemonSpawn::Base
  def start(_args)
    p 'started'
    false
    # sleep 100
  end

  def stop
    p 'stopped'
  end
end

TestService.spawn!(log_file: './test_service.log',
                   pid_file: './test_service.pid',
                   sync_log: true,
                   working_dir: File.dirname(__FILE__))
