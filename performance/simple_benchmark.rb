require 'benchmark/ips'
require_relative 'simple_theme_runner'

Liquid::Template.error_mode = ARGV.first.to_sym if ARGV.first
profiler = SimpleThemeRunner.new

Benchmark.ips do |x|
  x.time = 60
  x.warmup = 5

  puts
  puts "Running benchmark for #{x.time} seconds (with #{x.warmup} seconds warmup)."
  puts

  x.report("parse:") { profiler.parse }
  x.report("parse and render:") { profiler.parse_and_render }
end
