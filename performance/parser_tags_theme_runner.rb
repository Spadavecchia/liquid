# coding: utf-8
# This profiler parse a simple template

$:.unshift __dir__ + '/../lib'
require_relative '../lib/liquid'

class SimpleThemeRunner
  # Load the simple template in memory, do this now so that
  # we don't profile IO.
  def initialize
    @tmpl = Liquid::Template.new
    @big_literal = File.read(__dir__ + '/tests/simple/big_literal.liquid')
    @big_literal_with_tags = File.read(__dir__ + '/tests/simple/big_literal_with_tags.liquid')
    @complex = "{% increment a %}{% if true %}{% decrement b %}{% if false %}{% increment c %}One{% decrement d %}{% elsif true %}Two{% else %}Three{% endif %}{% endif %}{% decrement d %}{% if false %}Four{% endif %}Last"
    @small_literal = "X"
    @assign = "Price in stock {% assign a = 5 %} Final Price"
    @capture = """
Lore@m Ipsum is simply dummy text {% capture first_variable %}Hey{% endcapture %}of the printing and typesetting industry. Lorem Ipsum has {% capture first_variable %}Hey{% endcapture %}been the industry's standard dummy text ever since the {% capture first_variable %}Hey{% endcapture %}1500s, when an unknown printer {% capture first_variable %}Hey{% endcapture %}took a galley of type and scrambled it {% capture first_variable %}Hey{% endcapture %}to make a type specimen book. It has survived {% capture first_variable %}Hey{% endcapture %}not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged{% capture first_variable %}Hey{% endcapture %}. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker {% capture first_variable %}Hey{% endcapture %}including versions of Lorem Ipsum.Open{% capture first_variable %}Hey{% endcapture %}{% capture second_variable %}Hello{% endcapture %}{% capture last_variable %}{% endcapture %}CloseOpen{% capture first_variable %}Hey{% endcapture %}{% capture second_variable %}Hello{% endcapture %}{% capture last_variable %}{% endcapture %}Close
"""
    @small_capture = "{% capture x %}X{% endcapture %}"
    @case_tag = "{% case condition %}{% when 1 %} its 1 {% when 2 %} its 2 {% endcase %}"
    @comment = "{% comment %} {% if true %} This is a commented block  {% endif true %}{% endcomment %}"
    @cycle = "This time {%cycle \"one\", \"two\"%} we win MF!"
    @decrement = "Total Price: {% decrement a %}"
    @for_tag = "{%for i in array.items offset:continue limit:1000 %}{{i}}{%endfor%}"
    @if_tag = "{% if false %} this text should not {% elsif true %} tests {% else %} go into the output {% endif %}"
    @include = "With text {% include 'snippet', my_variable: 'apples', my_other_variable: 'oranges' %} finally!"
    @increment = "Price with discount: {% increment a %}"
    @raw = "{% raw %} {% if true %} this is a raw block {% endraw %}"
    @tablerow = "{% tablerow item in array %}{% endtablerow %}"
  end

  def literal
    @tmpl.parse(@big_literal)
  end

  def small_literal
    @tmpl.parse(@small_literal)
  end

  def literal_with_tags
    @tmpl.parse(@big_literal_with_tags)
  end

  def assign
    @tmpl.parse(@assign)
  end

  def complex
    @tmpl.parse(@complex)
  end

  def capture
    @tmpl.parse(@capture)
  end

  def small_capture
    @tmpl.parse(@small_capture)
  end

  def case_tag
    @tmpl.parse(@case_tag)
  end

  def comment
    @tmpl.parse(@comment)
  end

  def cycle
    @tmpl.parse(@cycle)
  end

  def decrement
    @tmpl.parse(@decrement)
  end

  def for_tag
    @tmpl.parse(@for_tag)
  end

  def if_tag
    @tmpl.parse(@if_tag)
  end

  def include
    @tmpl.parse(@include)
  end

  def increment
    @tmpl.parse(@increment)
  end

  def raw
    @tmpl.parse(@raw)
  end

  def tablerow
    @tmpl.parse(@tablerow)
  end
end
