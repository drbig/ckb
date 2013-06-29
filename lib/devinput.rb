#!/usr/bin/env ruby
# coding: utf-8
# vim: ts=2 et sw=2 sts=2
#
# ckb/devinput.rb - Parse /dev/input/event blobs.
# 
# © Copyright Piotr S. Staszewski 2013
# Visit http://www.drbig.one.pl for contact information.
#

# DevInput parses keyboard-like events.
#
# Developed on linux x64 and may not be portable.
#
class DevInput
  attr_reader :dev

  Event = Struct.new(:tv_sec, :tv_usec, :type, :code, :value)
  # Event struct class that the events get parsed into.
  #
  class Event
    # Convert :tv_sec to Ruby's Time object.
    # @return [Time] the time object
    def time; Time.at(tv_sec); end
    # Check whether the event is a SYNC event
    # @return [true, false]
    def syn?; type == 0 && code == 0 && value == 0; end
  end

  # Create new DevInput object.
  # @param path [String] path to /dev/input/eventX
  def initialize(path)
    @dev = File.open(path)
  end

  # Read and parse a single event.
  #
  # Event size and/or format may be platform dependent.
  #   For linux x64:
  #   Bits:  (64 + 64) + 16 + 16 + 32 = 192
  #   Bytes: ( 8 +  8) +  2 +  2 +  4 = 24
  #
  # @return [DevInput::Event] the event parsed event
  #
  def read
    Event.new(*@dev.read(24).unpack('QQSSL'))
  end

  # Reads events forever.
  #
  # No error handling whatsoever.
  #
  # @return [DevInput::Event]
  #
  def each; loop do yield read end; end
end

# Can be used as en executable to test for events.
#
if __FILE__ == $0
  if ARGV.length != 1
    STDERR.puts "Usage: #{$0} /dev/input/eventX"
    exit(2)
  end

  DevInput.new(ARGV.first).each {|e| puts e }
end
