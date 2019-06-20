require 'forwardable'

class MyQueue
  extend Forwardable
  def initialize
    @queue = []
  end

  def enqueue(*values)
    values.each{ |v| @queue << v }
  end

  def dequeue
    @queue.shift
  end

  def_delegators(:@queue, :first, :last, :size, :clear)
end
