# frozen_string_literal: true

# Win class
class Win

  attr_gtk

  def tick
    init
    render
    input
    update

    outputs.primitives << args.gtk.framerate_diagnostics_primitives
  end

  def init
  end

  def render
  end

  def input
  end

  def update
  end
end

$gtk.reset
