# coding: utf-8
# This profiler parse a simple template

$:.unshift __dir__ + '/../lib'
require_relative '../lib/liquid'

class SimpleThemeRunner
  # Load template in memory, do this now so that
  # we don't profile IO.
  def initialize
    @complex = File.read(__dir__ + '/tests/simple/complex.liquid')
  end

  def empty
    tmpl = Liquid::Template.new
    tmpl.parse("")
  end

  def tag
    tmpl = Liquid::Template.new
    tmpl.parse("with additional text before... {% decrement a %} and after")
  end

  def simple
    tmpl = Liquid::Template.new
    tmpl.parse("{% for item in array %} Repeat this {% else %} Array Empty {% endfor %}")
  end

  def middle
    tmpl = Liquid::Template.new
    tmpl.parse("""
      <h1>{{ product.name }}</h1>
      <h2>{{ product.price }}</h2>
      <h2>{{ product.price }}</h2>
      {% comment %}This is a commentary{% endcomment %}
      {% raw %}This is a raw tag{% endraw %}
      {% for item in array %} Repeat this {% else %} Array Empty {% endfor %}
    """)
  end

  def complex
    tmpl = Liquid::Template.new
    tmpl.parse(@complex)
  end
end
