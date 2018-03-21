# This profiler parse a simple template

$:.unshift __dir__ + '/../lib'
require_relative '../lib/liquid'

class SimpleThemeRunner
  # Load the simple template in memory, do this now so that
  # we don't profile IO.
  def initialize
    @test = File.read(__dir__ + '/tests/simple/simple.liquid')
  end

  def parse
    tmpl = Liquid::Template.new
    tmpl.parse(@test)
  end

  def parse_and_render
    tmpl = Liquid::Template.new
    tmpl.parse(@test).render!()
  end
end
