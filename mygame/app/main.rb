# frozen_string_literal: true

# utilities
require 'app/utils.rb'

# imports

# scenes
require 'app/scenes/game'
require 'app/scenes/menu'
require 'app/scenes/credits'
require 'app/scenes/win'
require 'app/scenes/lose'

def boot(_args)
  $gtk.disable_console if $gtk.production?
end

def tick(args)
  $game ||= Game.new
  $credits ||= Credits.new
  $lose ||= Lose.new
  $menu ||= Menu.new
  $win ||= Win.new

  args.state.current_scene ||= :game_scene
  current_scene = args.state.current_scene

  # scene tick selector
  case current_scene
  when :game_scene
    $game.args = args
    $game.tick
  when :credits_scene
    $credits.args = args
    $credits.tick
  when :win_scene
    $win.args = args
    $win.tick
  when :menu_scene
    $menu.args = args
    $menu.tick
  when :lose_scene
    $lose.args = args
    $lose.tick
  end

  # make sure that the current_scene flag wasn't set mid tick
  if args.state.current_scene != current_scene
    raise 'Scene was changed incorrectly. Set args.state.next_scene to change scenes.'
  end

  # if next scene was set/requested, then transition the current scene to the next scene
  return unless args.state.next_scene

  args.state.current_scene = args.state.next_scene
  args.state.next_scene = nil
end

def reset args
  $game = nil
  $lose = nil
  $win = nil
  $credits = nil
  $menu = nil
end

$gtk.reset
