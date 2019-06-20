module MyForwardable
  def def_delegator(accessor, method, ali = method)
    module_eval(<<"EOS"
      def #{ali}(*values)
        if values.length == 0
          #{accessor}.#{method}
        elsif values.length == 1
          #{accessor}.#{method}(values.first)
        else
          #{accessor}.#{method}(values)
        end
      end
EOS
    )
  end

  def def_delegators(accessor, *methods)
    methods.each { |method| def_delegator(accessor, method) } 
  end
end