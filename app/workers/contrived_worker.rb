require "sneakers"
require "sneakers/metrics/logging_metrics"

class ContrivedWorker
  include Sneakers::Worker

  from_queue(
    :contrived_route_one,
    threads: 50,
    prefetch: 50,
    timeout_job_after: 1
  )

  def work(msg)
    contrived_work = msg.tr("work", "👩‍🏭")

    puts("Broadcasting that this worker did a thing: #{contrived_work}")

    worker_trace "Found: #{contrived_work}"

    ack!
  end
end