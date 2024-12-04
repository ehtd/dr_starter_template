# frozen_string_literal: true

def random(min, max)
  min = Integer(min)
  max = Integer(max)
  rand((max + 1) - min) + min
end

def fisher_yates_shuffle(array)
  n = array.length
  (n - 1).downto(1) do |i|
    j = random(0, i) # Random index from 0 to i
    array[i], array[j] = array[j], array[i] # Swap elements
  end
  array
end

def remap(value, from_min, from_max, to_min, to_max)
  (value - from_min) * (to_max - to_min) / (from_max - from_min) + to_min
end

def hex_to_rgba(hex, alpha = 255)
  r = (hex >> 16) & 0xFF
  g = (hex >> 8) & 0xFF
  b = hex & 0xFF

  { r: r, g: g, b: b, a: alpha }
end
