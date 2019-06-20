require 'forwardable'

class MyStack
  extend Forwardable
  def initialize
    @stack = []
  end

  def_delegator(:@stack, :last, :peek)
  def_delegators(:@stack, :push, :pop, :size, :clear)
end
