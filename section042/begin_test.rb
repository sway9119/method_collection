def begin_test(sym)
  flow = []
  value = begin
    case sym
    when :normal then flow << "OK"
    when :argument_err then raise AugumentError
    when :not_implemented then raise NotImplementedError
    when :runtime_err then raise RuntimeError
    end
    :begin
  rescue => e
    flow << "normal rescue"
    :rescue
  rescue NotImplementedError => e # NotImplementedErrorのみ
    flow << "NotImplementedError"
    :rescue_NotImplementedError
  rescue Exception
    flow << "Exception"
    :exception
  else
    flow << "no error"
    :else
  ensure
    flow << "ensure"
    :ensure    
  end
  flow << "outer"
  {flow: flow, value: value}
end

p begin_test :normal
# => {:flow=>["OK", "no error", "ensure", "outer"], :value=>:else}
p begin_test :argument_err
# => {:flow=>["normal rescue", "ensure", "outer"], :value=>:rescue}
p begin_test :not_implemented
# => {:flow=>["NotImplementedError", "ensure", "outer"], :value=>:rescue_NotImplementedError}
p begin_test :runtime_err
# => {:flow=>["normal rescue", "ensure", "outer"], :value=>:rescue}