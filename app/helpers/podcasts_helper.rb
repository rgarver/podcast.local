module PodcastsHelper
  def duration_seconds_to_hh_mm_ss(duration)
    (Time.now.at_midnight + duration).strftime("%H:%M:%S")
  end
end
