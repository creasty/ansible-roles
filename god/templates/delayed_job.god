God.watch do |w|
  w.name = "#{PROJECT_NAME}: DelayedJob" # need to be unique

  w.interval = 30.seconds
  w.uid = '{{ user.name }}'
  w.gid = '{{ user.name }}'

  w.start = "/bin/bash -c 'cd #{APPLICATION_ROOT}/current; " +
            "RAILS_ENV=#{RAILS_ENV} " +
            "BUNDLE_GEMFILE=#{APPLICATION_ROOT}/current/Gemfile " +
            "bundle exec ./bin/delayed_job start'"

  w.log = "#{APPLICATION_ROOT}/shared/tmp/log/delayed_job.log"
  w.pid_file = "#{APPLICATION_ROOT}/shared/tmp/pids/delayed_job.pid"

  w.start_grace = 30.seconds
  w.restart_grace = 30.seconds

  w.behavior :clean_pid_file

  w.start_if do |start|
    w.keepalive

    start.condition(:process_running) do |c|
      c.interval = 5.seconds
      c.running = false
      c.notify = ALERT_TO
    end
  end
end
