#!/usr/bin/env ruby
# coding: utf-8
# vim: ts=2 et sw=2 sts=2
#
# ckb/keyboard.rb - Read single keycode.
# 
# © Copyright Piotr S. Staszewski 2013
# Visit http://www.drbig.one.pl for contact information.
#

%w{ devinput }.each {|s| require_relative s + '.rb' }

# KeyboardError exception for indicating logical errors in parsed events.
#
class KeyboardError < Exception; end

# Keyboard class for reading single key presses.
#
class Keyboard < DevInput
  # Read a single key press.
  #
  # Checks for proper SYNC events and matching key codes.
  # This will most likely *not* handle things like repeat (i.e. pressing and holding a key).
  #
  # @return [Integer] the key code
  #
  def read_key
    evs = 4.times.collect { read }
    raise KeyboardError, 'Key mismatch' unless evs[0].code == evs[2].code
    raise KeyboardError, 'Missing SYN(s)' unless evs[1].syn? && evs[3].syn?
    evs.first.code
  end
end
