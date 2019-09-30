require "nokogiri"
require "open-uri"
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
    doc = Nokogiri::HTML(open(msg))

    page_title = doc.css("title").text

    puts("Broadcasting that this worker did a thing: #{page_title}")

    worker_trace "Found: #{page_title}"

    ack!
  end
end