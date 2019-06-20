require 'forwardable'

class MyQueue
  extend Forwardable
  def initialize
    @queue = []
  end

  def_delegator(:@queue, :push, :enqueue)
  def_delegator(:@queue, :shift, :dequeue)
  def_delegators(:@queue, :first, :last, :size, :clear)
end
