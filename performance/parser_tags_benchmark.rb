require 'benchmark/ips'
require_relative 'parser_tags_theme_runner'

Liquid::Template.error_mode = ARGV.first.to_sym if ARGV.first
profiler = SimpleThemeRunner.new

Benchmark.ips do |x|
  x.time = 30
  x.warmup = 5

  puts
  puts "Running benchmark for #{x.time} seconds (with #{x.warmup} seconds warmup)."
  puts

  x.report("small literal") { profiler.small_literal }
  x.report("increment") { profiler.increment }
  x.report("decrement") { profiler.decrement }
  x.report("raw") { profiler.raw }
  x.report("assign") { profiler.assign }
  x.report("cycle") { profiler.cycle }
  x.report("small capture") { profiler.small_capture }
  x.report("comment") { profiler.comment }
  x.report("include") { profiler.include }
  x.report("tablerow") { profiler.tablerow }
  x.report("literal") { profiler.literal }
  x.report("if") { profiler.if_tag }
  x.report("for") { profiler.for_tag }
  x.report("case") { profiler.case_tag }
  x.report("complex") { profiler.complex }
  x.report("literal with tags") { profiler.literal_with_tags }
  x.report("capture") { profiler.capture }
end
