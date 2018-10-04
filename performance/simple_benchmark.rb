require 'benchmark/ips'
require_relative 'simple_theme_runner'

Liquid::Template.error_mode = ARGV.first.to_sym if ARGV.first
profiler = SimpleThemeRunner.new

Benchmark.ips do |x|
  x.time = 30
  x.warmup = 5

  puts
  puts "Running benchmark for #{x.time} seconds (with #{x.warmup} seconds warmup)."
  puts

  x.report("complex:") { profiler.complex }
  x.report("middle:") { profiler.middle }
  x.report("simple:") { profiler.simple }
  x.report("empty:") { profiler.empty }
end
