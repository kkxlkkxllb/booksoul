# config/initializers/delayed_job_config.rb
Delayed::Worker.destroy_failed_jobs = true
Delayed::Worker.sleep_delay = 20
Delayed::Worker.max_attempts = 2
Delayed::Worker.max_run_time = 5.minutes